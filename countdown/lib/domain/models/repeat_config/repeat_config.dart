import 'package:freezed_annotation/freezed_annotation.dart';

part 'repeat_config.freezed.dart';

@freezed
class RepeatConfiguration with _$RepeatConfiguration {
  const factory RepeatConfiguration({
    required RepeatType type,
    @Default(1) int interval,
  }) = _RepeatConfiguration;
}

enum RepeatType {
  daily,
  weekly,
  monthly,
  yearly;

  String get displayName {
    switch (this) {
      case RepeatType.daily:
        return 'Daily';
      case RepeatType.weekly:
        return 'Weekly';
      case RepeatType.monthly:
        return 'Monthly';
      case RepeatType.yearly:
        return 'Yearly';
    }
  }
}
