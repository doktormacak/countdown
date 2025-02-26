// lib/domain/use_cases/save_event_use_case.dart
import 'package:countdown/data/repository/countdown_repository.dart';
import 'package:countdown/data/repository/countdown_repository_provider.dart';
import 'package:countdown/data/services/notifications_manager.dart';
import 'package:countdown/domain/models/countdown_event/countdown_event.dart';
import 'package:countdown/utils/result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'save_event_use_case.g.dart';

class SaveEventUseCase {
  final CountdownRepository _repository;
  final NotificationManager _notificationManager;

  SaveEventUseCase(this._repository, this._notificationManager);

  Future<Result<void>> execute(CountdownEvent event) async {
    // 1. Save event to repository
    final result = await _repository.saveEvent(event);

    // 2. Schedule notifications on success
    await result.fold(
      (_) async {
        // Success - schedule notifications
        await _notificationManager.scheduleEventNotification(event);
      },
      (error) async {
        // Error - do nothing
      },
    );

    // Return the original result
    return result;
  }
}

@riverpod
Future<SaveEventUseCase> saveEventUseCase(Ref ref) async {
  final repository = await ref.watch(countdownRepositoryProvider.future);
  final notificationManager =
      await ref.watch(notificationManagerProvider.future);
  return SaveEventUseCase(repository, notificationManager);
}
