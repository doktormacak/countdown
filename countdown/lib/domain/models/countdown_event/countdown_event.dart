import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../event_timing_details/event_timing_details.dart';
import '../notification_settings/notification_settings.dart';

part 'countdown_event.freezed.dart';
part 'countdown_event.g.dart';

enum EventType {
  oneTime,
  recurring,
}

@freezed
class CountdownEvent with _$CountdownEvent {
  const factory CountdownEvent({
    required String id,
    required String title,
    String? notes,
    String? iconName,
    required DateTime createdAt,
    @Default([]) List<String> tags,
    required EventType type,
    required EventTimingDetails timing,
    required NotificationSettings notificationSettings,
    @Default(false) bool isArchived,
  }) = _CountdownEvent;

  factory CountdownEvent.create({
    required String title,
    String? notes,
    String? iconName,
    required DateTime createdAt,
    List<String> tags = const [],
    required EventType type,
    required EventTimingDetails timing,
    required NotificationSettings notificationSettings,
    bool isArchived = false,
  }) {
    return CountdownEvent(
      id: const Uuid().v4(),
      title: title,
      notes: notes,
      iconName: iconName,
      createdAt: createdAt,
      tags: tags,
      type: type,
      timing: timing,
      notificationSettings: notificationSettings,
      isArchived: isArchived,
    );
  }

  factory CountdownEvent.fromJson(Map<String, dynamic> json) =>
      _$CountdownEventFromJson(json);
}
