import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:bloodglucose_monitoring_flutterapp/model/glucose.dart';

class DatabaseHelper {
  static final shared = DatabaseHelper();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('glucose.db');
    return _database!;
  }

  //initial database
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  //create new database
  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    // final realType = 'REAL NOT NULL';
    final textType = 'TEXT NOT NULL';

//create glucoseTable with given schema
    await db.execute('''
      CREATE TABLE glucoseTable ( 
        _id $idType, 
        value $textType,
        timestamp $textType,
        unit $textType
        )
''');
  }

  //insert all Glucose objects in glucoseList to glucoseTable from db
  Future<void> insertAll(List<Glucose> glucoseList) async {
    final db = await shared.database;
    Batch batch = db.batch();

    glucoseList.forEach((element) {
      batch.insert("glucoseTable", element.toJson());
    });

    await batch.commit(noResult: true);
  }

  //read all Glucose records from glucoseTable from db
  Future<dynamic> readAll() async {
    final db = await shared.database;

    final result = await db.query("glucoseTable");

    return result;
  }

  //close instance of database
  Future close() async {
    final db = await shared.database;

    db.close();
  }
}
