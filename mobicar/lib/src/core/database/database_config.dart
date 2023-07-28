import 'package:mobicar/src/core/database/cars_migrations.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConference {
  static final DatabaseConference _dbController = DatabaseConference.internal();
  static Database? _db;

  factory DatabaseConference() => _dbController;

  Future<Database> get db async {
    if (_db != null) return _db!;

    return _db = await initBd();
  }

  DatabaseConference.internal();



  Future<Database> initBd() async {
    final  path = '${await getDatabasesPath()}cars.db';
    final base = await openDatabase(
      path,
      version: migrationScriptsCars.length,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );

    return base;
  }

  Future _onCreate(Database db, int version) async {
    for (var i = 1; i <= migrationScriptsCars.length; i++) {
      await db.execute(migrationScriptsCars[i]!);
    }
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    for (var i = oldVersion + 1; i <= newVersion; i++) {
      await db.execute(migrationScriptsCars[i]!);
    }
  }
}