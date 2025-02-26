// lib/domain/use_cases/archive_event_use_case.dart
import 'package:countdown/data/repository/countdown_repository.dart';
import 'package:countdown/data/repository/countdown_repository_provider.dart';
import 'package:countdown/data/services/notifications_manager.dart';
import 'package:countdown/utils/result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'archive_event_use_case.g.dart';

class ArchiveEventUseCase {
  final CountdownRepository _repository;
  final NotificationManager _notificationManager;

  ArchiveEventUseCase(this._repository, this._notificationManager);

  Future<Result<void>> execute(String eventId) async {
    // 1. Archive event
    final result = await _repository.archiveEvent(eventId);

    // 2. Cancel notifications on success
    await result.fold(
      (_) async {
        // Success - cancel notifications
        await _notificationManager.cancelEventNotification(eventId);
      },
      (error) async {
        // Error - do nothing
      },
    );

    return result;
  }
}

@riverpod
Future<ArchiveEventUseCase> archiveEventUseCase(Ref ref) async {
  final repository = await ref.watch(countdownRepositoryProvider.future);
  final notificationManager =
      await ref.watch(notificationManagerProvider.future);
  return ArchiveEventUseCase(repository, notificationManager);
}
