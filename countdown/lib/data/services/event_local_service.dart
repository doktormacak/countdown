import 'package:countdown/data/dto/event_dto.dart';
import 'package:countdown/data/services/database_service.dart';
import 'package:sqflite/sqflite.dart';

class EventLocalService {
  final DatabaseService _databaseService;
  static const String _table = 'events';

  EventLocalService({
    DatabaseService? databaseService,
  }) : _databaseService = databaseService ?? DatabaseService.instance;

  Future<List<EventDto>> getAllEvents() async {
    final db = await _databaseService.database;
    final maps = await db.query(_table);
    return maps.map((map) => EventDto.fromMap(map)).toList();
  }

  Future<void> insertEvent(EventDto event) async {
    final db = await _databaseService.database;
    await db.insert(
      _table,
      event.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateEvent(EventDto event) async {
    final db = await _databaseService.database;
    await db.update(
      _table,
      event.toMap(),
      where: 'id = ?',
      whereArgs: [event.id],
    );
  }

  Future<void> deleteEvent(String id) async {
    final db = await _databaseService.database;
    await db.delete(
      _table,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
