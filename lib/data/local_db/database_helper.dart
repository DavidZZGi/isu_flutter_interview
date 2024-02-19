import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  late Database _db;

  /// Private constructor to make sure that there is only one DatabaseHelper instance
  DatabaseHelper._privateConstructor();

  /// Only one DatabaseHelper instance
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  /// Method to get the database
  Future<Database> get database async {
    if (_db.isOpen) {
      return _db;
    }
    await initDatabase();
    return _db;
  }

  Future<void> initDatabase() async {
    String path = join(await getDatabasesPath(), 'test.db');
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    // Create tables
    await db.execute(
      'CREATE TABLE user(username TEXT, password TEXT)',
    );
    await db.execute(
      'CREATE TABLE ticket(id INTEGER PRIMARY KEY, clientName TEXT, address TEXT, ticketDate TEXT)',
    );
  }

  ///Dynamic CRUD operations for Tables
  Future<int> insertRecord(
      Map<String, dynamic> record, String tableName) async {
    Database db = await database;
    return await db.insert(tableName, record,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getDataFromTable(String tableName) async {
    Database db = await database;
    return await db.query(tableName);
  }

  Future<int> updateRecordInTable(
      Map<String, dynamic> record, String tableName) async {
    Database db = await database;
    return await db
        .update(tableName, record, where: 'id = ?', whereArgs: [record['id']]);
  }

  Future<int> deleteRecordInTable(int id, String tableName) async {
    Database db = await database;
    return await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
