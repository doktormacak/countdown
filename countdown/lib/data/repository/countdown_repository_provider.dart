import 'package:countdown/data/repository/countdown_repository.dart';
import 'package:countdown/data/repository/countdown_repository_impl.dart';
import 'package:countdown/data/services/events_database_service.dart';
import 'package:countdown/data/services/logger_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'countdown_repository_provider.g.dart';

@Riverpod(keepAlive: true)
Future<CountdownRepository> sqliteCountdownRepository(
  Ref ref,
) async {
  final dbService = await ref.watch(eventDatabaseServiceProvider.future);
  final logger = ref.watch(loggerProvider);

  return CountdownRepositoryImpl(dbService, logger);
}

// Override the base repository provider
@Riverpod(keepAlive: true)
Future<CountdownRepository> countdownRepository(Ref ref) {
  return ref.watch(sqliteCountdownRepositoryProvider.future);
}
