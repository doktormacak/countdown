import 'package:countdown/data/repository/countdown_repository_provider.dart';
import 'package:countdown/data/services/logger_service.dart';
import 'package:countdown/domain/models/countdown_event/countdown_event.dart';
import 'package:countdown/utils/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'countdown_event_view_model.g.dart';

@riverpod
class CountdowmEvemtViewModel extends _$CountdowmEvemtViewModel {
  @override
  FutureOr<List<CountdownEvent>> build() async {
    final repository = await ref.watch(countdownRepositoryProvider.future);

    // Listen to changes
    repository.watchActiveEvents().listen(
          (result) => result.fold(
            (events) => state = AsyncData(events),
            (error) {
              ref.read(loggerProvider).error('Failed to watch events', error);
              state = AsyncError(error, StackTrace.current);
            },
          ),
        );

    // Get initial state
    final initialResult = await repository.getActiveEvents();
    return initialResult.fold(
      (events) => events,
      (error) {
        ref.read(loggerProvider).error('Failed to get initial events', error);
        throw error;
      },
    );
  }

  Future<void> archiveEvent(String id) async {
    state = const AsyncLoading();
    try {
      final repository = await ref.read(countdownRepositoryProvider.future);
      final result = await repository.archiveEvent(id);

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
}
