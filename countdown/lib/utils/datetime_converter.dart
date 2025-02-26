// lib/core/utils/datetime_converter.dart
import 'package:freezed_annotation/freezed_annotation.dart';

class DateTimeConverter implements JsonConverter<DateTime, dynamic> {
  const DateTimeConverter();

  @override
  DateTime fromJson(dynamic json) {
    if (json is String) {
      return DateTime.parse(json);
    } else if (json is int) {
      return DateTime.fromMillisecondsSinceEpoch(json);
    } else if (json is DateTime) {
      return json;
    }
    return DateTime.now();
  }

  @override
  dynamic toJson(DateTime dateTime) {
    return dateTime.millisecondsSinceEpoch;
  }
}
