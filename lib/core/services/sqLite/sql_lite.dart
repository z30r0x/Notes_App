import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class sqlData {
  Future<Database> initialDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "note.db");

    Database mydb = await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
      onUpgrade: _onUpgrade,
    );
    return mydb;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE "notes"(
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT,
    "content" TEXT
    )
    ''');

    print(
      "************** Database created Successfully*************************",
    );
  }

  Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
      return _db;
    } else {
      return _db;
    }
  }

  Future<List<Map<dynamic, dynamic>>> selectData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  Future<int> insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  Future<int> updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  Future<int> deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

  Future<void> _onUpgrade(Database db, int oldversion, int newversion) async {
    print(
      "************** Database Updated Successfully*************************",
    );
  }
}
