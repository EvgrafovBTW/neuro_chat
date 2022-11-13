import 'dart:io';

import 'package:neuro_chat/constants.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "NeuroChat.db";
  static const _databaseVersion = 1;
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Database? _database;
  Future<Database> get database async {
    if (_database != null) {
      print('database initialized');
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    Database openDB = await openDatabase(path, version: _databaseVersion);
    createUserCredentialsTable(openDB);
    print('database initialized');
    return openDB;
  }

  createUserCredentialsTable(Database openDB) async {
    await openDB.execute('''
          CREATE TABLE IF NOT EXISTS $userCredentialsTable (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnUserLogin TEXT NOT NULL,
            $columnUserEmail TEXT NOT NULL,
            $columnUserPassword TEXT NOT NULL
          )
          ''');
    print('$userCredentialsTable created');
  }
}
