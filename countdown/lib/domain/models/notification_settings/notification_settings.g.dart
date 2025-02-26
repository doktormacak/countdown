// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationSettingsImpl _$$NotificationSettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationSettingsImpl(
      enabled: json['enabled'] as bool,
      reminders: (json['reminders'] as List<dynamic>)
          .map((e) => Duration(microseconds: (e as num).toInt()))
          .toList(),
      sound: $enumDecodeNullable(_$NotificationSoundEnumMap, json['sound']) ??
          NotificationSound.default_,
      vibrate: json['vibrate'] as bool? ?? true,
      snoozeEnabled: json['snoozeEnabled'] as bool? ?? false,
      snoozeDurations: (json['snoozeDurations'] as List<dynamic>?)
              ?.map((e) => Duration(microseconds: (e as num).toInt()))
              .toList() ??
          const [Duration(minutes: 5)],
    );

Map<String, dynamic> _$$NotificationSettingsImplToJson(
        _$NotificationSettingsImpl instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'reminders': instance.reminders.map((e) => e.inMicroseconds).toList(),
      'sound': _$NotificationSoundEnumMap[instance.sound]!,
      'vibrate': instance.vibrate,
      'snoozeEnabled': instance.snoozeEnabled,
      'snoozeDurations':
          instance.snoozeDurations.map((e) => e.inMicroseconds).toList(),
    };

const _$NotificationSoundEnumMap = {
  NotificationSound.default_: 'default_',
  NotificationSound.gentle: 'gentle',
  NotificationSound.urgent: 'urgent',
  NotificationSound.bell: 'bell',
  NotificationSound.chime: 'chime',
  NotificationSound.silent: 'silent',
};
