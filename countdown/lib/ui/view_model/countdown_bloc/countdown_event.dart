import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/countdown_event/countdown_event.dart';

part 'countdown_event.freezed.dart';

@freezed
sealed class CountdownBlocEvent with _$CountdownBlocEvent {
  const factory CountdownBlocEvent() = _CountdownBlocEvent;

  const factory CountdownBlocEvent.eventCreated({
    required CountdownEvent event,
  }) = CountdownBlocEventCreated;

  const factory CountdownBlocEvent.eventEdited({
    required CountdownEvent event,
  }) = CountdownBlocEventEdited;

  const factory CountdownBlocEvent.eventDeleted({
    required CountdownEvent event,
  }) = CountdownBlocEventDeleted;
}
