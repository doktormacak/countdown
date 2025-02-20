import 'package:freezed_annotation/freezed_annotation.dart';
part 'reccurence_pattern.freezed.dart';
part 'reccurence_pattern.g.dart';

enum RecurrenceType {
  daily,
  weekly,
  monthly,
  yearly,
}

@freezed
class RecurrencePattern with _$RecurrencePattern {
  const factory RecurrencePattern({
    required RecurrenceType type,
    required int interval,
    DateTime? endDate,
    int? occurrences,
  }) = _RecurrencePattern;

  factory RecurrencePattern.fromJson(Map<String, dynamic> json) =>
      _$RecurrencePatternFromJson(json);
}
