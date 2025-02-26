import 'package:countdown/data/repository/countdown_repository_provider.dart';
import 'package:countdown/data/services/logger_service.dart';
import 'package:countdown/domain/models/countdown_event/countdown_event.dart';
import 'package:countdown/domain/use_cases/archive_event_use_case.dart';
import 'package:countdown/domain/use_cases/save_event_use_case.dart';
import 'package:countdown/utils/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'countdown_event_view_model.g.dart';

@riverpod
class CountdownEventViewModel extends _$CountdownEventViewModel {
  @override
  FutureOr<List<CountdownEvent>> build() async {
    final repository = await ref.watch(countdownRepositoryProvider.future);
    repository.watchActiveEvents().listen(
          (result) => result.fold(
            (events) => state = AsyncData(events),
            (error) {
              ref.read(loggerProvider).error('Failed to watch events', error);
              state = AsyncError(error, StackTrace.current);
            },
          ),
        );
    final initialResult = await repository.getActiveEvents();
    return initialResult.fold(
      (events) => events,
      (error) {
        ref.read(loggerProvider).error('Failed to get initial events', error);
        throw error;
      },
    );
  }

  Future<void> createEvent(CountdownEvent event) async {
    state = const AsyncLoading();
    try {
      final useCase = await ref.read(saveEventUseCaseProvider.future);
      final result = await useCase.execute(event);

      result.fold(
        (_) => ref.read(loggerProvider).info('Event created: ${event.id}'),
        (error) {
          ref.read(loggerProvider).error('Failed to create event', error);
          throw error;
        },
      );
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<void> archiveEvent(String id) async {
    state = const AsyncLoading();
    try {
      final useCase = await ref.read(archiveEventUseCaseProvider.future);
      final result = await useCase.execute(id);

      result.fold(
        (_) => ref.read(loggerProvider).info('Event archived: $id'),
        (error) {
          ref.read(loggerProvider).error('Failed to archive event', error);
          throw error;
        },
      );
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<void> deleteEvent(String id) async {
    state = const AsyncLoading();
    try {
      final repository = await ref.read(countdownRepositoryProvider.future);
      final result = await repository.deleteEvent(id);

      result.fold(
        (_) => ref.read(loggerProvider).info('Event deleted: $id'),
        (error) {
          ref.read(loggerProvider).error('Failed to delete event', error);
          throw error;
        },
      );
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }

  Future<CountdownEvent> getEventById(String id) async {
    state = const AsyncLoading();
    try {
      final repository = await ref.read(countdownRepositoryProvider.future);
      final result = await repository.getEventById(id);
      return result.fold(
        (event) => event,
        (error) {
          ref.read(loggerProvider).error('Failed to get event by id', error);
          throw error;
        },
      );
    } catch (e, stack) {
      state = AsyncError(e, stack);
      rethrow;
    }
  }
}
