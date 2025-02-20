import 'package:countdown/domain/models/reccurence_pattern/reccurence_pattern.dart';
import 'package:countdown/domain/models/time_of_day/time_of_day.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_timing_details.freezed.dart';
part 'event_timing_details.g.dart';

@freezed
class EventTimingDetails with _$EventTimingDetails {
  const factory EventTimingDetails.oneTime({
    required DateTime eventTime,
    required String timeZone,
  }) = OneTimeEventTiming;

  const factory EventTimingDetails.recurring({
    required RecurrencePattern pattern,
    @TimeOfDayConverter() required TimeOfDay timeOfDay,
    required Set<int> daysOfWeek,
    String? timeZone,
  }) = RecurringEventTiming;

  factory EventTimingDetails.fromJson(Map<String, dynamic> json) =>
      _$EventTimingDetailsFromJson(json);
}
