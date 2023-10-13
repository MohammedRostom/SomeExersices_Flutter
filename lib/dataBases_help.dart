import 'dart:async';
import 'package:flutter_applicatioaserwerwr/model/newsModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBasesHelper {
  DataBasesHelper._();
  static final DataBasesHelper db = DataBasesHelper._();

  static Database? _dataBases;
  Future<Database?> get dataBases async {
    if (_dataBases == null) {
      _dataBases = await initializeDatabaseMethod();
    }
    return _dataBases;
  }

  Future<Database> initializeDatabaseMethod() async {
    String path = join(await getDatabasesPath(), "database.db");
    Database myData = await openDatabase(path, version: 1, onCreate: onCreate);

    return myData;
  }

  Future<void> onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE product (
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name TEXT,
      descraption TEXT,
      price TEXT,
      quntaty  INTEGER,
      productId TEXT
    )
  ''');
    print("++++++++++++++ Table Created: product ++++++++++++++");
  }

  Future<Cartdmodel?> insertDataInUserModel(Cartdmodel user) async {
    print(user);
    var dbClient = await dataBases;
    await dbClient!.insert("product", user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("+++++++++++++++++${user.toMap()} +++++++++++++++++");

    return user;
  }

  // Future<Cartdmodel?> UpdattDataInUserModel(Cartdmodel user) async {
  //   var dbClient = await dataBases;
  //   await dbClient!.update(
  //     "Users",
  //     user.toMap(),
  //     where: "id=?",
  //     whereArgs: [user.Id],
  //   );
  
  //   print("+++++++++++++++++ Hello Updated +++++++++++++++++");
  // }

  Future<Cartdmodel?> readDataOnlyOneRow(int id) async {
    var dbClient = await dataBases;
    List<Map<String, dynamic>> maps = await dbClient!.query(
      "product",
      where: "id=?",
      whereArgs: [id],
    );

    if (maps.length > 0) {
      return Cartdmodel.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<List<Cartdmodel?>> GetDataAll() async {
    var dbClient = await dataBases;
    List<Map<String, dynamic>> maps = await dbClient!.query(
      "product",
    );

    List<Cartdmodel> list = maps.isNotEmpty
        ? maps.map((user) => Cartdmodel.fromJson(user)).toList()
        : [];

    return list;
  }

  Future<void> DeleteDataOnlyOneRow(int id) async {
    var dbClient = await dataBases;
    List<Map<String, dynamic>> maps = await dbClient!.query(
      "product",
      where: "id = ?",
      whereArgs: [id],
    );
    print("+++++++++++++++++ Hello deleted one   +++++++++++++++++");
  }
}
