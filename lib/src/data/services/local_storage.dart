import 'package:sqflite/sqflite.dart';

abstract class LocalStorage {
  Future<List<Map<String, dynamic>>> getAll({required String table});

  Future<void> removeAll({required String table});

  Future<void> save({
    required String table,
    required Map<String, dynamic> value,
  });
}

class LocalStorageImpl implements LocalStorage {
  final Database _database;

  LocalStorageImpl({required Database database}) : _database = database;

  @override
  Future<List<Map<String, dynamic>>> getAll({required String table}) {
    return _database.query(table);
  }

  @override
  Future<void> removeAll({required String table}) {
    return _database.delete(table);
  }

  @override
  Future<void> save({
    required String table,
    required Map<String, dynamic> value,
  }) async {
    await _database.insert(
      table,
      value,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}

enum Tables { customers }
