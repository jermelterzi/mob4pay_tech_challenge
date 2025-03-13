import 'package:flutter/material.dart';
import 'package:mob4pay_tech_challenge/src/app.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initAppDatabase();

  runApp(const MyApp());
}

Future<Database> _initAppDatabase() async {
  final databasePath = await getDatabasesPath();
  final database = openDatabase(
    join(databasePath, 'mob4pay_database.db'),
    onCreate: (db, _) {
      return db.execute(
        'CREATE TABLE costumers(id INTEGER PRIMARY KEY, name TEXT, age INTEGER, email TEXT, address TEXT, city TEXT, state TEXT)',
      );
    },
  );

  return database;
}
