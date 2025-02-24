import 'package:countdown/data/database/scehma.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../services/logger_service.dart';

part 'database_provider.g.dart';

@Riverpod(keepAlive: true)
Future<DatabaseService> databaseService(Ref ref) async {
  final logger = ref.watch(loggerProvider);
  final provider = DatabaseService(logger);
  await provider.database;
  return provider;
}

class DatabaseService {
  static const String dbName = 'countdown_app.db';
  static const int dbVersion = 1;

  final LoggerService _logger;
  Database? _database;

  DatabaseService(this._logger);

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    _logger.info('Initializing database');
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);

    return await openDatabase(
      path,
      version: dbVersion,
      onCreate: DatabaseSchema.onCreate,
    );
  }

  Future<void> close() async {
    _logger.info('Closing database connection');
    if (_database != null) {
      await _database!.close();
      _database = null;
    }
  }
}
