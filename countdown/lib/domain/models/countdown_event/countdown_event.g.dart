// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countdown_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CountdownEventImpl _$$CountdownEventImplFromJson(Map<String, dynamic> json) =>
    _$CountdownEventImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      notes: json['notes'] as String?,
      iconName: json['iconName'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      type: $enumDecode(_$EventTypeEnumMap, json['type']),
      timing:
          EventTimingDetails.fromJson(json['timing'] as Map<String, dynamic>),
      notificationSettings: NotificationSettings.fromJson(
          json['notificationSettings'] as Map<String, dynamic>),
      isArchived: json['isArchived'] as bool? ?? false,
    );

Map<String, dynamic> _$$CountdownEventImplToJson(
        _$CountdownEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'notes': instance.notes,
      'iconName': instance.iconName,
      'createdAt': instance.createdAt.toIso8601String(),
      'tags': instance.tags,
      'type': _$EventTypeEnumMap[instance.type]!,
      'timing': instance.timing,
      'notificationSettings': instance.notificationSettings,
      'isArchived': instance.isArchived,
    };

const _$EventTypeEnumMap = {
  EventType.oneTime: 'oneTime',
  EventType.recurring: 'recurring',
};
