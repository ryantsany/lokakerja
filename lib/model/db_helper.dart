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
    ${Worker.COLUMN_NAME} TEXT,
    ${Worker.COLUMN_JOB} TEXT,
    ${Worker.COLUMN_WORK_HOUR} TEXT,
    ${Worker.COLUMN_CONTRACT_DURATION} TEXT,
    ${Worker.COLUMN_SALARY} TEXT
  )
  ''';

  String kontrakTable = '''
  CREATE TABLE ${Contract.TABLE_CONTRACT}(
    ${Contract.COLUMN_ID} INTEGER PRIMARY KEY AUTOINCREMENT,
    ${Contract.COLUMN_JOB} TEXT,
    ${Contract.COLUMN_JOB_DURATION} TEXT,
    ${Contract.COLUMN_CONTRACT_DURATION} TEXT,
    ${Contract.COLUMN_SALARY} TEXT
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

  // Method untuk kontrak
  Future<int> insertContract(Contract contract) async {
    Database db = await database;
    return await db.insert(Contract.TABLE_CONTRACT, contract.toMap());
  }

  Future<Contract?> getContract(String job, String jobDuration, String contractDuration, String salary) async {
    Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      Contract.TABLE_CONTRACT,
      where: '${Contract.COLUMN_JOB} = ? AND ${Contract.COLUMN_JOB_DURATION} = ? AND ${Contract.COLUMN_CONTRACT_DURATION} = ? AND ${Contract.COLUMN_SALARY} = ?',
      whereArgs: [job, jobDuration, contractDuration, salary],
    );
    if (results.isNotEmpty) {
      return Contract.fromMap(results.first);
    }
    return null;
  }

  Future<List<Map<String, dynamic>>> getContracts() async {
    Database db = await database;
    return await db.query(Contract.TABLE_CONTRACT);
  }
}