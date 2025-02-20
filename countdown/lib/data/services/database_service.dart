import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static const _databaseName = 'countdown.db';
  static const _databaseVersion = 1;

  DatabaseService._();
  static final DatabaseService instance = DatabaseService._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE events(
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        notes TEXT,
        iconName TEXT,
        dateTime TEXT NOT NULL,
        tags TEXT,
        timezone TEXT NOT NULL,
        isRepeating INTEGER DEFAULT 1,
      )
    ''');
  }
}
