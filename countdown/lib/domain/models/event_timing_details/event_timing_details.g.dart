// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_timing_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OneTimeEventTimingImpl _$$OneTimeEventTimingImplFromJson(
        Map<String, dynamic> json) =>
    _$OneTimeEventTimingImpl(
      eventTime: DateTime.parse(json['eventTime'] as String),
      timeZone: json['timeZone'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$OneTimeEventTimingImplToJson(
        _$OneTimeEventTimingImpl instance) =>
    <String, dynamic>{
      'eventTime': instance.eventTime.toIso8601String(),
      'timeZone': instance.timeZone,
      'runtimeType': instance.$type,
    };

_$RecurringEventTimingImpl _$$RecurringEventTimingImplFromJson(
        Map<String, dynamic> json) =>
    _$RecurringEventTimingImpl(
      pattern:
          RecurrencePattern.fromJson(json['pattern'] as Map<String, dynamic>),
      timeOfDay:
          const TimeOfDayConverter().fromJson(json['timeOfDay'] as String),
      daysOfWeek: (json['daysOfWeek'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toSet(),
      timeZone: json['timeZone'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$RecurringEventTimingImplToJson(
        _$RecurringEventTimingImpl instance) =>
    <String, dynamic>{
      'pattern': instance.pattern,
      'timeOfDay': const TimeOfDayConverter().toJson(instance.timeOfDay),
      'daysOfWeek': instance.daysOfWeek.toList(),
      'timeZone': instance.timeZone,
      'runtimeType': instance.$type,
    };
