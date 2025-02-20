import 'package:freezed_annotation/freezed_annotation.dart';
part 'notification_settings.freezed.dart';
part 'notification_settings.g.dart';

enum NotificationSound {
  default_,
  gentle,
  urgent,
}

@freezed
class NotificationSettings with _$NotificationSettings {
  const factory NotificationSettings({
    required bool enabled,
    required List<Duration> reminders,
    @Default(NotificationSound.default_) NotificationSound sound,
    @Default(true) bool vibrate,
  }) = _NotificationSettings;

  factory NotificationSettings.fromJson(Map<String, dynamic> json) =>
      _$NotificationSettingsFromJson(json);
}
