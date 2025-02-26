import 'package:freezed_annotation/freezed_annotation.dart';
part 'notification_settings.freezed.dart';
part 'notification_settings.g.dart';

@freezed
class NotificationSettings with _$NotificationSettings {
  const factory NotificationSettings({
    required bool enabled,
    required List<Duration> reminders,
    @Default(NotificationSound.default_) NotificationSound sound,
    @Default(true) bool vibrate,
    @Default(false) bool snoozeEnabled,
    @Default([Duration(minutes: 5)]) List<Duration> snoozeDurations,
  }) = _NotificationSettings;

  factory NotificationSettings.fromJson(Map<String, dynamic> json) =>
      _$NotificationSettingsFromJson(json);
}

/// Predefined notification reminders
class NotificationReminders {
  static const fiveMinutes = Duration(minutes: 5);
  static const tenMinutes = Duration(minutes: 10);
  static const fifteenMinutes = Duration(minutes: 15);
  static const thirtyMinutes = Duration(minutes: 30);
  static const oneHour = Duration(hours: 1);
  static const twoHours = Duration(hours: 2);
  static const threeHours = Duration(hours: 3);
  static const sixHours = Duration(hours: 6);
  static const twelveHours = Duration(hours: 12);
  static const oneDay = Duration(days: 1);
  static const twoDays = Duration(days: 2);
  static const oneWeek = Duration(days: 7);

  /// Common presets
  static List<Duration> get minimal => [thirtyMinutes];
  static List<Duration> get standard => [oneHour, tenMinutes];
  static List<Duration> get extended => [oneDay, oneHour, fifteenMinutes];
  static List<Duration> get comprehensive =>
      [oneWeek, oneDay, threeHours, thirtyMinutes, fiveMinutes];
}

/// Notification sounds options
enum NotificationSound { default_, gentle, urgent, bell, chime, silent }

/// Convert string duration representations to Duration objects
Duration parseDuration(String durationString) {
  final parts = durationString.split(':');
  if (parts.length != 3) {
    throw const FormatException('Invalid duration format');
  }

  final hours = int.parse(parts[0]);
  final minutes = int.parse(parts[1]);
  final seconds = int.parse(parts[2]);

  return Duration(
    hours: hours,
    minutes: minutes,
    seconds: seconds,
  );
}

/// Convert Duration to string representation
String formatDuration(Duration duration) {
  String twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  final hours = twoDigits(duration.inHours);
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));

  return "$hours:$minutes:$seconds";
}

/// JsonConverter for Duration type
class DurationConverter implements JsonConverter<Duration, String> {
  const DurationConverter();

  @override
  Duration fromJson(String json) => parseDuration(json);

  @override
  String toJson(Duration object) => formatDuration(object);
}
