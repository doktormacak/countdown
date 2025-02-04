import 'dart:async';

import 'package:countdown/domain/models/countdown_event/countdown_event.dart';
import 'package:countdown/ui/view_model/countdown_bloc/countdown_event.dart';
import 'package:countdown/ui/view_model/countdown_bloc/countdown_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountdownBloc extends Bloc<CountdownBlocEvent, CountdownState> {
  late Timer _timer;

  CountdownBloc() : super(const CountdownState()) {
    on<CountdownBlocEventCreated>(_onEventCreated);
    on<CountdownBlocEventEdited>(_onEventEdited);
    on<CountdownBlocEventDeleted>(_onEventDeleted);
    on<UpdatedTimers>(_onUpdatedTimers);

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      add(const UpdatedTimers());
    });
  }

  void _onEventCreated(
      CountdownBlocEventCreated event, Emitter<CountdownState> emit) {
    emit(
      state.copyWith(events: [...state.events, event.event]),
    );
  }

  void _onEventEdited(
      CountdownBlocEventEdited event, Emitter<CountdownState> emit) {
    final editedEventIndex = state.events.indexWhere(
      (element) => element.id == event.event.id,
    );
    final editedEvents = List<CountdownEvent>.from(state.events);
    editedEvents[editedEventIndex] = event.event;
    emit(state.copyWith(events: editedEvents));
  }

  void _onEventDeleted(
      CountdownBlocEventDeleted event, Emitter<CountdownState> emit) {
    final deletedEvents = List<CountdownEvent>.from(state.events)
      ..removeWhere((e) => e.id == event.event.id);
    emit(state.copyWith(events: deletedEvents));
  }

  void _onUpdatedTimers(UpdatedTimers event, Emitter<CountdownState> emit) {
    emit(state.copyWith(lastUpdated: DateTime.now()));
  }
}
