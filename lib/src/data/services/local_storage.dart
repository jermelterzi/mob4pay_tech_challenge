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
  final Database database;

  LocalStorageImpl({required this.database});

  @override
  Future<List<Map<String, dynamic>>> getAll({required String table}) {
    return database.query(table);
  }

  @override
  Future<void> removeAll({required String table}) {
    return database.delete(table);
  }

  @override
  Future<void> save({
    required String table,
    required Map<String, dynamic> value,
  }) async {
    await database.insert(
      table,
      value,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
