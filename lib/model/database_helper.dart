import 'package:lokakerja/config.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  final String databaseName = DB_SCHEME;

  String userTable = '''
  CREATE TABLE user(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT,
    email TEXT,
    password TEXT,
    role TEXT
  )
  ''';

  String kontrakTable = '''
  CREATE TABLE kontrak(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    jobname TEXT,
    duration TEXT,
    contract_duration TEXT,
    salary TEXT
  )
  ''';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    // String path = join(await getDatabasesPath(), databaseName);
    return await openDatabase(
      "lokakerja.db",
      version: 1,
      onCreate: (db, version) async {
        await db.execute(userTable);
        await db.execute(kontrakTable);
      },
    );
  }

  Future<int> insertUser(Map<String, dynamic> user) async {
    Database db = await database;
    return await db.insert('user', user);
  }

  Future<Map<String, dynamic>?> getUser(String username, String password) async {
    Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      'user',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );
    if (results.isNotEmpty) {
      return results.first;
    }
    return null;
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    Database db = await database;
    return await db.query('user');
  }
}