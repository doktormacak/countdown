import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/countdown_event/countdown_event.dart';

part 'countdown_state.freezed.dart';

@freezed
class CountdownState with _$CountdownState {
  const factory CountdownState({
    @Default([]) List<CountdownEvent> events,
  }) = _CountdownState;
}
