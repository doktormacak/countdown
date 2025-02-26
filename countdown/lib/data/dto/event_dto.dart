// lib/infrastructure/dtos/event_dto.dart
import 'dart:convert';
import 'package:countdown/domain/models/countdown_event/countdown_event.dart';

class EventDTO {
  final String id;
  final String title;
  final String? notes;
  final String? iconName;
  final int createdAt;
  final String tags;
  final String type;
  final String timingJson;
  final String notificationSettingsJson;
  final int isArchived;

  EventDTO({
    required this.id,
    required this.title,
    this.notes,
    this.iconName,
    required this.createdAt,
    required this.tags,
    required this.type,
    required this.timingJson,
    required this.notificationSettingsJson,
    required this.isArchived,
  });

  factory EventDTO.fromDomain(CountdownEvent event) {
    final map = event.toJson();
    final dynamic createdAtValue = map['createdAt'];
    final int timestamp;

    if (createdAtValue is DateTime) {
      timestamp = createdAtValue.millisecondsSinceEpoch;
    } else if (createdAtValue is String) {
      timestamp = DateTime.parse(createdAtValue).millisecondsSinceEpoch;
    } else {
      timestamp = DateTime.now().millisecondsSinceEpoch;
    }

    return EventDTO(
      id: map['id'],
      title: map['title'],
      notes: map['notes'],
      iconName: map['iconName'],
      createdAt: timestamp,
      tags: jsonEncode(map['tags']),
      type: map['type'],
      timingJson: jsonEncode(map['timing']),
      notificationSettingsJson: jsonEncode(map['notificationSettings']),
      isArchived: map['isArchived'] ? 1 : 0,
    );
  }

  // To Domain
  CountdownEvent toDomain() {
    return CountdownEvent.fromJson({
      'id': id,
      'title': title,
      'notes': notes,
      'iconName': iconName,
      'createdAt': DateTime.fromMillisecondsSinceEpoch(createdAt),
      'tags': jsonDecode(tags),
      'type': type,
      'timing': jsonDecode(timingJson),
      'notificationSettings': jsonDecode(notificationSettingsJson),
      'isArchived': isArchived == 1,
    });
  }

  factory EventDTO.fromMap(Map<String, dynamic> map) {
    return EventDTO(
      id: map['id'],
      title: map['title'],
      notes: map['notes'],
      iconName: map['icon_name'],
      createdAt: map['created_at'],
      tags: map['tags'],
      type: map['type'],
      timingJson: map['timing_json'],
      notificationSettingsJson: map['notification_settings_json'],
      isArchived: map['is_archived'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'notes': notes,
      'icon_name': iconName,
      'created_at': createdAt,
      'tags': tags,
      'type': type,
      'timing_json': timingJson,
      'notification_settings_json': notificationSettingsJson,
      'is_archived': isArchived,
    };
  }
}
