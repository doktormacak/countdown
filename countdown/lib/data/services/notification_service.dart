import 'package:countdown/domain/models/countdown_event/countdown_event.dart';
import 'package:countdown/domain/models/event_timing_details/event_timing_details.dart';
import 'package:countdown/domain/models/reccurence_pattern/reccurence_pattern.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'logger_service.dart';

part 'notification_service.g.dart';

class NotificationService {
  final LoggerService _logger;
  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  NotificationService(this._logger) {
    _init();
  }

  Future<void> _init() async {
    tz.initializeTimeZones();

    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    DarwinInitializationSettings iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      notificationCategories: [
        DarwinNotificationCategory(
          'countdown',
          actions: <DarwinNotificationAction>[
            DarwinNotificationAction.plain('id_1', 'Action 1'),
            DarwinNotificationAction.plain(
              'id_2',
              'Action 2',
              options: <DarwinNotificationActionOption>{
                DarwinNotificationActionOption.destructive,
              },
            ),
            DarwinNotificationAction.plain(
              'id_3',
              'Action 3',
              options: <DarwinNotificationActionOption>{
                DarwinNotificationActionOption.foreground,
              },
            ),
          ],
          options: <DarwinNotificationCategoryOption>{
            DarwinNotificationCategoryOption.hiddenPreviewShowTitle,
          },
        ),
      ],
    );

    InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    try {
      await _notifications.initialize(
        initSettings,
        onDidReceiveNotificationResponse: _onNotificationTap,
      );
      _logger.info('Notification service initialized');

      await _requestPermissions();
    } catch (e, stack) {
      _logger.error('Failed to initialize notifications', e, stack);
    }
  }

  Future<void> _requestPermissions() async {
    try {
      // For Android, we need to request permission based on the Android version
      final platform = _notifications.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();
      if (platform != null) {
        await platform.requestNotificationsPermission();
        _logger.info('Android notification permission requested');
      }

      // For iOS, permissions are requested during initialization
    } catch (e, stack) {
      _logger.error('Error requesting notification permissions', e, stack);
    }
  }

  void _onNotificationTap(NotificationResponse response) {
    // Handle notification tap
    _logger.info('Notification tapped: ${response.payload}');

    // TODO: Navigate to event details when tapped
  }

  // Schedule notifications for an event
  Future<void> scheduleEventNotifications(CountdownEvent event) async {
    try {
      // Cancel any existing notifications for this event
      await cancelEventNotifications(event.id);

      if (!event.notificationSettings.enabled) {
        _logger.info('Notifications disabled for event: ${event.id}');
        return;
      }

      // Calculate notification times
      final notificationTimes = _calculateNotificationTimes(event);

      // Schedule each notification
      for (var i = 0; i < notificationTimes.length; i++) {
        final scheduledTime = notificationTimes[i];
        final reminderId = '${event.id}-$i'; // Unique ID for each reminder

        // Skip if the time is in the past
        if (scheduledTime.isBefore(tz.TZDateTime.now(tz.local))) {
          _logger.debug('Skipping past notification: $reminderId');
          continue;
        }

        await _scheduleNotification(
          id: reminderId.hashCode, // Convert string ID to int
          title: event.title,
          body: _getNotificationBody(event, i),
          scheduledTime: scheduledTime,
          payload: event.id,
        );

        _logger.info(
            'Scheduled notification for event: ${event.id}, time: ${scheduledTime.toString()}');
      }
    } catch (e, stack) {
      _logger.error(
          'Failed to schedule notifications for event: ${event.id}', e, stack);
    }
  }

  // Cancel all notifications for an event
  Future<void> cancelEventNotifications(String eventId) async {
    try {
      // Since we don't know how many reminders there were, we'll just use a prefix search
      final pendingNotifications =
          await _notifications.pendingNotificationRequests();

      for (final notification in pendingNotifications) {
        if (notification.payload != null &&
            notification.payload!.startsWith(eventId)) {
          await _notifications.cancel(notification.id);
          _logger.debug('Cancelled notification: ${notification.id}');
        }
      }

      _logger.info('Cancelled notifications for event: $eventId');
    } catch (e, stack) {
      _logger.error(
          'Failed to cancel notifications for event: $eventId', e, stack);
    }
  }

  // Schedule a single notification
  Future<void> _scheduleNotification({
    required int id,
    required String title,
    required String body,
    required tz.TZDateTime scheduledTime,
    String? payload,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'countdown_events',
      'Countdown Events',
      channelDescription: 'Notifications for countdown events',
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _notifications.zonedSchedule(
      id,
      title,
      body,
      scheduledTime,
      details,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: payload,
    );
  }

  // Calculate notification times based on event and reminder settings
  List<tz.TZDateTime> _calculateNotificationTimes(CountdownEvent event) {
    final List<tz.TZDateTime> notificationTimes = [];

    switch (event.timing) {
      case OneTimeEventTiming timing:
        // Get the event time
        final eventTime = timing.eventTime;

        // For each reminder duration, calculate the notification time
        for (final reminder in event.notificationSettings.reminders) {
          final notificationTime = tz.TZDateTime.from(
            eventTime.subtract(reminder),
            tz.local,
          );
          notificationTimes.add(notificationTime);
        }

      case RecurringEventTiming timing:
        // For recurring events, we schedule notifications for the next occurrence
        // Will be updated when the app launches or when the user interacts with the app
        final now = DateTime.now();

        // Create a candidate time for today
        DateTime candidate = DateTime(
          now.year,
          now.month,
          now.day,
          timing.timeOfDay.hour,
          timing.timeOfDay.minute,
        );

        // If the time has already passed for today, start with tomorrow
        if (candidate.isBefore(now)) {
          candidate = candidate.add(const Duration(days: 1));
        }

        // Handle specific recurrence patterns
        switch (timing.pattern.type) {
          case RecurrenceType.daily:
            // Just return the candidate, it's already set for the next occurrence
            break;

          case RecurrenceType.weekly:
            // Find the next day of the week that matches the pattern
            while (!timing.daysOfWeek.contains(candidate.weekday)) {
              candidate = candidate.add(const Duration(days: 1));
            }
            break;

          case RecurrenceType.monthly:
          case RecurrenceType.yearly:
            // Simplified for now - use the next daily occurrence
            // TODO: Implement proper handling for monthly/yearly patterns
            break;
        }

        // Now that we have the next occurrence, schedule reminders
        for (final reminder in event.notificationSettings.reminders) {
          final notificationTime = tz.TZDateTime.from(
            candidate.subtract(reminder),
            tz.local,
          );
          notificationTimes.add(notificationTime);
        }
    }

    return notificationTimes;
  }

  // Generate notification text based on event type and reminder index
  String _getNotificationBody(CountdownEvent event, int reminderIndex) {
    final reminder = event.notificationSettings.reminders[reminderIndex];

    String timeDescription;
    if (reminder.inDays > 0) {
      timeDescription =
          '${reminder.inDays} day${reminder.inDays > 1 ? 's' : ''}';
    } else if (reminder.inHours > 0) {
      timeDescription =
          '${reminder.inHours} hour${reminder.inHours > 1 ? 's' : ''}';
    } else if (reminder.inMinutes > 0) {
      timeDescription =
          '${reminder.inMinutes} minute${reminder.inMinutes > 1 ? 's' : ''}';
    } else {
      timeDescription = 'soon';
    }

    switch (event.type) {
      case EventType.oneTime:
        return 'Your event is happening in $timeDescription!';
      case EventType.recurring:
        return 'Your recurring event is happening in $timeDescription!';
    }
  }
}

@Riverpod(keepAlive: true)
NotificationService notificationService(Ref ref) {
  final logger = ref.watch(loggerProvider);
  return NotificationService(logger);
}
