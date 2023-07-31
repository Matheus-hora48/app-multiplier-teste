import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobicar/src/core/database/database_config.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  tearDownAll(() async {
    final database = await DatabaseCars().db;
    deleteDatabase(database.path);
  });

  test('Create database cars', () async {
    final database = await DatabaseCars().db;
    expect(database.isOpen, true);
  });
}
