// lib/core/utils/countdown_calculator.dart
import 'package:countdown/domain/models/countdown_event/countdown_event.dart';
import 'package:countdown/domain/models/event_timing_details/event_timing_details.dart';
import 'package:countdown/domain/models/reccurence_pattern/reccurence_pattern.dart';

/// Represents the remaining time until an event
class TimeRemaining {
  final int days;
  final int hours;
  final int minutes;
  final int seconds;
  final bool isNegative;

  const TimeRemaining({
    required this.days,
    required this.hours,
    required this.minutes,
    required this.seconds,
    this.isNegative = false,
  });

  /// Whether the countdown has completed (zero or negative time)
  bool get isComplete =>
      isNegative || (days == 0 && hours == 0 && minutes == 0 && seconds == 0);

  /// Total duration in seconds
  int get totalSeconds => days * 86400 + hours * 3600 + minutes * 60 + seconds;

  /// Returns a formatted string representation (e.g., "2d 5h 30m 10s")
  String get formatted {
    final buffer = StringBuffer();

    if (isNegative) {
      buffer.write('-');
    }

    if (days > 0) {
      buffer.write('${days}d ');
    }

    if (days > 0 || hours > 0) {
      buffer.write('${hours}h ');
    }

    if (days > 0 || hours > 0 || minutes > 0) {
      buffer.write('${minutes}m ');
    }

    buffer.write('${seconds}s');
    return buffer.toString();
  }

  /// Creates a TimeRemaining object from a Duration
  factory TimeRemaining.fromDuration(Duration duration) {
    final isNegative = duration.isNegative;
    final positiveDuration = duration.abs();

    final days = positiveDuration.inDays;
    final hours = positiveDuration.inHours % 24;
    final minutes = positiveDuration.inMinutes % 60;
    final seconds = positiveDuration.inSeconds % 60;

    return TimeRemaining(
      days: days,
      hours: hours,
      minutes: minutes,
      seconds: seconds,
      isNegative: isNegative,
    );
  }
}

/// Class responsible for calculating countdown times
class CountdownCalculator {
  /// Calculate time remaining for a given event
  static TimeRemaining getTimeRemaining(CountdownEvent event) {
    final now = DateTime.now();
    final eventTime = _getNextOccurrence(event, now);
    final duration = eventTime.difference(now);

    return TimeRemaining.fromDuration(duration);
  }

  /// Get the next occurrence of an event based on its timing
  static DateTime _getNextOccurrence(CountdownEvent event, DateTime now) {
    return switch (event.timing) {
      OneTimeEventTiming timing => timing.eventTime,
      RecurringEventTiming timing => _getNextRecurringOccurrence(timing, now),
      _ => DateTime.now(),
    };
  }

  /// Calculate the next occurrence of a recurring event
  static DateTime _getNextRecurringOccurrence(
      RecurringEventTiming timing, DateTime now) {
    final timeOfDay = timing.timeOfDay;
    final pattern = timing.pattern;

    // Create a candidate time for today
    DateTime candidate = DateTime(
      now.year,
      now.month,
      now.day,
      timeOfDay.hour,
      timeOfDay.minute,
    );

    // If the time has already passed for today, start with tomorrow
    if (candidate.isBefore(now)) {
      candidate = candidate.add(const Duration(days: 1));
    }

    // Handle specific recurrence patterns
    switch (pattern.type) {
      case RecurrenceType.daily:
        // Just return the candidate, it's already set for the next occurrence
        break;

      case RecurrenceType.weekly:
        // Find the next day of the week that matches the pattern
        while (!timing.daysOfWeek.contains(_getDayOfWeek(candidate))) {
          candidate = candidate.add(const Duration(days: 1));
        }
        break;

      case RecurrenceType.monthly:
        // Skip to next month if needed (simplified - same day each month)
        if (candidate.day != now.day) {
          // Go to next month
          if (now.month == 12) {
            candidate = DateTime(
                now.year + 1, 1, now.day, timeOfDay.hour, timeOfDay.minute);
          } else {
            candidate = DateTime(now.year, now.month + 1, now.day,
                timeOfDay.hour, timeOfDay.minute);
          }
        }
        break;

      case RecurrenceType.yearly:
        // Skip to next year if needed (simplified - same day each year)
        if (candidate.month != now.month || candidate.day != now.day) {
          candidate = DateTime(now.year + 1, now.month, now.day, timeOfDay.hour,
              timeOfDay.minute);
        }
        break;
    }

    return candidate;
  }

  /// Convert DateTime.weekday (1-7 for Mon-Sun) to our day of week index
  static int _getDayOfWeek(DateTime date) {
    return date.weekday; // Already using 1-7 (Monday to Sunday)
  }
}
