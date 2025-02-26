import 'package:countdown/data/repository/countdown_repository.dart';
import 'package:countdown/data/repository/countdown_repository_provider.dart';
import 'package:countdown/domain/models/countdown_event/countdown_event.dart';
import 'package:countdown/utils/result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'logger_service.dart';
import 'notification_service.dart';

part 'notifications_manager.g.dart';

/// Manages the scheduling and handling of notifications for all events
class NotificationManager {
  final LoggerService _logger;
  final NotificationService _notificationService;
  final CountdownRepository _repository;

  NotificationManager(
      this._logger, this._notificationService, this._repository);

  /// Initialize notification manager and schedule notifications for all active events
  Future<void> initialize() async {
    try {
      _logger.info('Initializing notification manager');
      await scheduleAllEventNotifications();
    } catch (e, stack) {
      _logger.error('Failed to initialize notification manager', e, stack);
    }
  }

  /// Schedule event notification after saving/updating
  Future<void> scheduleEventNotification(CountdownEvent event) async {
    try {
      if (event.isArchived || !event.notificationSettings.enabled) {
        _logger.info(
            'Skipping notifications for event: ${event.id} (archived or disabled)');
        return;
      }

      await _notificationService.scheduleEventNotifications(event);
    } catch (e, stack) {
      _logger.error(
          'Failed to schedule notification for event: ${event.id}', e, stack);
    }
  }

  /// Cancel notifications for an event
  Future<void> cancelEventNotification(String eventId) async {
    try {
      await _notificationService.cancelEventNotifications(eventId);
    } catch (e, stack) {
      _logger.error(
          'Failed to cancel notifications for event: $eventId', e, stack);
    }
  }

  /// Re-schedule all notifications for active events
  Future<void> scheduleAllEventNotifications() async {
    try {
      _logger.info('Scheduling notifications for all active events');

      // Get all active events
      final eventsResult = await _repository.getActiveEvents();

      await eventsResult.fold(
        (events) async {
          _logger.info('Found ${events.length} active events to schedule');

          // Cancel all existing notifications first
          // This is a precaution to avoid duplicate notifications
          // await _notificationService.cancelAllNotifications();

          // Schedule notifications for each active event
          for (final event in events) {
            if (event.notificationSettings.enabled) {
              await _notificationService.scheduleEventNotifications(event);
            }
          }
        },
        (error) async {
          _logger.error('Failed to get active events', error);
        },
      );
    } catch (e, stack) {
      _logger.error('Failed to schedule all event notifications', e, stack);
    }
  }

  /// Handle when an event is saved (both create and update)
  Future<void> onEventSaved(CountdownEvent event) async {
    await scheduleEventNotification(event);
  }

  /// Handle when an event is archived/deleted
  Future<void> onEventArchived(String eventId) async {
    await cancelEventNotification(eventId);
  }
}

@Riverpod(keepAlive: true)
Future<NotificationManager> notificationManager(Ref ref) async {
  final logger = ref.watch(loggerProvider);
  final notificationService = ref.watch(notificationServiceProvider);
  final repository = await ref.watch(countdownRepositoryProvider.future);

  final manager = NotificationManager(logger, notificationService, repository);
  await manager.initialize();
  return manager;
}
