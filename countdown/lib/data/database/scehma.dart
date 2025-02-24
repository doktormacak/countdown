import 'package:sqflite/sqflite.dart';

class DatabaseSchema {
  static Future<void> onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE events (
        id TEXT PRIMARY KEY,
        title TEXT NOT NULL,
        notes TEXT,
        icon_name TEXT,
        created_at INTEGER NOT NULL,
        tags TEXT,
        type TEXT NOT NULL,
        timing_json TEXT NOT NULL,
        notification_settings_json TEXT NOT NULL,
        is_archived INTEGER NOT NULL DEFAULT 0
      )
    ''');

    await _createIndices(db);
  }

  static Future<void> _createIndices(Database db) async {
    await db.execute('CREATE INDEX idx_events_type ON events(type)');
    await db
        .execute('CREATE INDEX idx_events_is_archived ON events(is_archived)');
  }
}
