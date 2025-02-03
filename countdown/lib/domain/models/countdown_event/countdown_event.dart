// lib/models/countdown_event.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../repeat_config/repeat_config.dart';

part 'countdown_event.freezed.dart';

@freezed
class CountdownEvent with _$CountdownEvent {
  const factory CountdownEvent({
    required String id,
    required String name,
    String? notes,
    String? iconName,
    required DateTime dateTime,
    @Default([]) List<String> tags,
    required String timezone,
    @Default(false) bool isRepeating,
    RepeatConfiguration? repeatConfig,
  }) = _CountdownEvent;

  factory CountdownEvent.create({
    required String name,
    String? notes,
    String? iconName,
    required DateTime dateTime,
    List<String> tags = const [],
    required String timezone,
    bool isRepeating = false,
    RepeatConfiguration? repeatConfig,
  }) {
    return CountdownEvent(
      id: const Uuid().v4(),
      name: name,
      notes: notes,
      iconName: iconName,
      dateTime: dateTime,
      tags: tags,
      timezone: timezone,
      isRepeating: isRepeating,
      repeatConfig: repeatConfig,
    );
  }
}

extension CountdownEventX on CountdownEvent {
  DateTime getNextOccurrence() {
    if (!isRepeating || repeatConfig == null) return dateTime;

    final now = DateTime.now();
    if (dateTime.isAfter(now)) return dateTime;

    DateTime nextDate = dateTime;
    final interval = repeatConfig!.interval;

    while (nextDate.isBefore(now)) {
      switch (repeatConfig!.type) {
        case RepeatType.daily:
          nextDate = nextDate.add(Duration(days: interval));
        case RepeatType.weekly:
          nextDate = nextDate.add(Duration(days: 7 * interval));
        case RepeatType.monthly:
          nextDate = DateTime(
            nextDate.year,
            nextDate.month + interval,
            nextDate.day,
            nextDate.hour,
            nextDate.minute,
          );
        case RepeatType.yearly:
          nextDate = DateTime(
            nextDate.year + interval,
            nextDate.month,
            nextDate.day,
            nextDate.hour,
            nextDate.minute,
          );
      }
    }
    return nextDate;
  }

  Duration getRemainingDuration() {
    final nextOccurrence = getNextOccurrence();
    return nextOccurrence.difference(DateTime.now());
  }

  String getFormattedRemainingTime() {
    final duration = getRemainingDuration();
    final days = duration.inDays;
    final hours = duration.inHours % 24;
    final minutes = duration.inMinutes % 60;

    if (days > 0) {
      return '$days days, $hours hours';
    } else if (hours > 0) {
      return '$hours hours, $minutes minutes';
    } else {
      return '$minutes minutes';
    }
  }

  bool get isUpcoming => getNextOccurrence().isAfter(DateTime.now());
  bool get isPassed => !isRepeating && dateTime.isBefore(DateTime.now());
}
