// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reccurence_pattern.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecurrencePatternImpl _$$RecurrencePatternImplFromJson(
        Map<String, dynamic> json) =>
    _$RecurrencePatternImpl(
      type: $enumDecode(_$RecurrenceTypeEnumMap, json['type']),
      interval: (json['interval'] as num).toInt(),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      occurrences: (json['occurrences'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RecurrencePatternImplToJson(
        _$RecurrencePatternImpl instance) =>
    <String, dynamic>{
      'type': _$RecurrenceTypeEnumMap[instance.type]!,
      'interval': instance.interval,
      'endDate': instance.endDate?.toIso8601String(),
      'occurrences': instance.occurrences,
    };

const _$RecurrenceTypeEnumMap = {
  RecurrenceType.daily: 'daily',
  RecurrenceType.weekly: 'weekly',
  RecurrenceType.monthly: 'monthly',
  RecurrenceType.yearly: 'yearly',
};
