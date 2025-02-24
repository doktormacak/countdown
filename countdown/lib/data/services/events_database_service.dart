import 'package:countdown/data/database/database_provider.dart';
import 'package:countdown/data/services/logger_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

import '../../utils/result.dart';
import '../dto/event_dto.dart';

part 'events_database_service.g.dart';

@Riverpod(keepAlive: true)
Future<EventsDatabaseService> eventDatabaseService(Ref ref) async {
  final db = await ref.watch(databaseServiceProvider.future);
  final logger = ref.watch(loggerProvider);
  return EventsDatabaseService(db, logger);
}

class EventsDatabaseService {
  final DatabaseService _db;
  final LoggerService _logger;

  EventsDatabaseService(this._db, this._logger);

  Future<Result<List<EventDTO>>> getAllEvents() async {
    try {
      final db = await _db.database;
      final results = await db.query('events');
      return Result.ok(results.map(EventDTO.fromMap).toList());
    } catch (e, stack) {
      _logger.error('Failed to get all events', e, stack);
      return Result.error(
          EventsDatabaseException('Failed to get all events', e));
    }
  }

  Future<Result<EventDTO>> getEventById(String id) async {
    try {
      final db = await _db.database;
      final results = await db.query(
        'events',
        where: 'id = ?',
        whereArgs: [id],
        limit: 1,
      );

      return Result.ok(EventDTO.fromMap(results.first));
    } catch (e, stack) {
      _logger.error('Failed to get event by id: $id', e, stack);
      return Result.error(
          EventsDatabaseException('Failed to get event by id: $id', e));
    }
  }

  Future<Result<List<EventDTO>>> getActiveEvents() async {
    try {
      final db = await _db.database;
      final results = await db.query(
        'events',
        where: 'is_archived = ?',
        whereArgs: [0],
      );
      return Result.ok(results.map(EventDTO.fromMap).toList());
    } catch (e, stack) {
      _logger.error('Failed to get active events', e, stack);
      return Result.error(
          EventsDatabaseException('Failed to get active events', e));
    }
  }

  Future<Result<void>> insertEvent(EventDTO event) async {
    try {
      final db = await _db.database;
      await db.insert(
        'events',
        event.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return const Result.ok(null);
    } catch (e, stack) {
      _logger.error('Failed to insert event: ${event.id}', e, stack);
      return Result.error(EventsDatabaseException('Failed to insert event', e));
    }
  }

  Future<Result<bool>> deleteEvent(String id) async {
    try {
      final db = await _db.database;
      final count = await db.delete(
        'events',
        where: 'id = ?',
        whereArgs: [id],
      );
      return Result.ok(count > 0);
    } catch (e, stack) {
      _logger.error('Failed to delete event: $id', e, stack);
      return Result.error(EventsDatabaseException('Failed to delete event', e));
    }
  }

  Future<Result<bool>> archiveEvent(String id) async {
    try {
      final db = await _db.database;
      final count = await db.update(
        'events',
        {'is_archived': 1},
        where: 'id = ?',
        whereArgs: [id],
      );
      return Result.ok(count > 0);
    } catch (e, stack) {
      _logger.error('Failed to archive event: $id', e, stack);
      return Result.error(
          EventsDatabaseException('Failed to archive event', e));
    }
  }

  Future<Result<List<EventDTO>>> searchEvents(String query) async {
    try {
      final db = await _db.database;
      final results = await db.query(
        'events',
        where: 'title LIKE ? OR notes LIKE ?',
        whereArgs: ['%$query%', '%$query%'],
      );
      return Result.ok(results.map(EventDTO.fromMap).toList());
    } catch (e, stack) {
      _logger.error('Failed to search events: $query', e, stack);
      return Result.error(
          EventsDatabaseException('Failed to search events', e));
    }
  }
}
