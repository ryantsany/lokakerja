import 'package:lokakerja/config.dart';
import 'package:sqflite/sqflite.dart';
import 'package:lokakerja/model/user.dart';
import 'package:lokakerja/model/worker.dart';
import 'package:lokakerja/model/contract.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  final String databaseName = DB_SCHEME;

  String userTable = '''
  CREATE TABLE ${User.TABLE_USER}(
    ${User.COLUMN_ID} INTEGER PRIMARY KEY AUTOINCREMENT,
    ${User.COLUMN_USERNAME} TEXT,
    ${User.COLUMN_EMAIL} TEXT,
    ${User.COLUMN_PASSWORD} TEXT,
    ${User.COLUMN_ROLE} TEXT
  )
  ''';

  String workerTable = '''
  CREATE TABLE ${Worker.TABLE_WORKER}(
    ${Worker.COLUMN_ID} INTEGER PRIMARY KEY AUTOINCREMENT,
    ${Worker.COLUMN_USER_ID} INTEGER,
    ${Worker.COLUMN_NAME} TEXT,
    ${Worker.COLUMN_JOB} TEXT,
    ${Worker.COLUMN_WORK_HOUR} TEXT,
    ${Worker.COLUMN_CONTRACT_DURATION} TEXT,
    ${Worker.COLUMN_SALARY} TEXT,
    FOREIGN KEY (${Worker.COLUMN_USER_ID}) 
    REFERENCES ${User.TABLE_USER} (${User.COLUMN_ID})
    ON DELETE CASCADE
  )
  ''';

  String kontrakTable = '''
  CREATE TABLE ${Contract.TABLE_CONTRACT}(
    ${Contract.COLUMN_ID} INTEGER PRIMARY KEY AUTOINCREMENT,
    ${Contract.COLUMN_USER_ID} INTEGER,
    ${Contract.COLUMN_JOB} TEXT,
    ${Contract.COLUMN_JOB_DURATION} TEXT,
    ${Contract.COLUMN_CONTRACT_DURATION} TEXT,
    ${Contract.COLUMN_SALARY} TEXT,
    FOREIGN KEY (${Contract.COLUMN_USER_ID}) 
    REFERENCES ${User.TABLE_USER} (${User.COLUMN_ID})
    ON DELETE CASCADE
  )
  ''';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      "lokakerja.db",
      version: 1,
      onCreate: (db, version) async {
        await db.execute(userTable);
        await db.execute(workerTable);
        await db.execute(kontrakTable);
        await db.execute('PRAGMA foreign_keys = ON');
      },
      onConfigure: (db) async{
        await db.execute('PRAGMA foreign_keys = ON');
      },
    );
  }

  // Methods untuk user
  Future<int> insertUser(User user) async {
    Database db = await database;
    return await db.insert('user', user.toMap());
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

  //  Method untuk worker
  Future<int> insertWorker(Worker worker) async {
    Database db = await database;
    return await db.insert('worker', worker.toMap());
  }

  Future<List<Worker>> getWorkers() async {
    Database db = await database;
    List<Map<String, dynamic>> workers = await db.query('worker');
    return workers.map((worker) => Worker.fromMap(worker)).toList();
  }

  Future<List<Worker>> getWorkersByUserId(int userId) async {
    Database db = await database;
    List<Map<String, dynamic>> workers = await db.query(
      'worker',
      where: 'user_id = ?',
      whereArgs: [userId],
    );
    return workers.map((worker) => Worker.fromMap(worker)).toList();
  }

  Future<int> countWorkersByUserId(int userId) async {
    Database db = await database;
    List<Map<String, dynamic>> workers = await db.query(
      'worker',
      where: 'user_id = ?',
      whereArgs: [userId],
    );
    return workers.length;
  }

  // Method untuk kontrak
  Future<int> insertContract(Contract contract) async {
    Database db = await database;
    return await db.insert(Contract.TABLE_CONTRACT, contract.toMap());
  }

  Future<List<Contract>> getContract(int userId) async {
  Database db = await database;
  List<Map<String, dynamic>> results = await db.query(
    'contract',
    where: 'user_id = ?',
    whereArgs: [userId],
  );
  return results.map((results) => Contract.fromMap(results)).toList();
  }


  Future<List<Map<String, dynamic>>> getContracts() async {
    Database db = await database;
    return await db.query(Contract.TABLE_CONTRACT);
  }

  Future<int> countContractsByUserId(int userId) async {
    Database db = await database;
    List<Map<String, dynamic>> contracts = await db.query(
      'contract',
      where: 'user_id = ?',
      whereArgs: [userId],
    );
    return contracts.length;
  }
}