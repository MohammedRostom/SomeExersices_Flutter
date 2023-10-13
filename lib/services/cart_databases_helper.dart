// import 'dart:async';
// import 'package:flutter_applicatioaserwerwr/model/newsModel.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// class cart_databases_helper {
//   cart_databases_helper._();
//   static final cart_databases_helper db = cart_databases_helper._();

//   static Database? _dataBases;
//   Future<Database?> get dataBases async {
//     if (_dataBases == null) {
//       _dataBases = await initializeDatabaseMethod();
//     }
//     return _dataBases;
//   }

//   Future<Database> initializeDatabaseMethod() async {
//     String path = join(await getDatabasesPath(), "database.db");
//     Database myData = await openDatabase(path, version: 3, onCreate: onCreate);

//     return myData;
//   }

//   Future<void> onCreate(Database db, int version) async {
//     await db.execute('''
//     CREATE TABLE notes (
//       id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
//       title TEXT,
//       subTitle TEXT
//     )
//   ''');
//     print("++++++++++++++ Table Created: notes ++++++++++++++");
//   }

// //InsrtData in table  with modele Servises
//   Future<NotModel?> insertDataInNotModel(NotModel InserNoteOpj) async {
//     var dbClient = await dataBases;
//     await dbClient!.insert("notes", InserNoteOpj.toMap(),
//         conflictAlgorithm: ConflictAlgorithm.replace);
//     print("+++++++++++++++++${InserNoteOpj.toMap()} +++++++++++++++++");

//     return InserNoteOpj;
//   }

//   Future<Cartdmodel?> UpdattDataInNotModel(NotModel onte) async {
//     var dbClient = await dataBases;
//     await dbClient!.update(
//       "notes",
//       onte.toMap(),
//       where: "id=?",
//       whereArgs: [onte.id],
//     );
//     print("+++++++++++++++++ Hello Updated +++++++++++++++++");
//   }

// //GetOnlyData Servises
//   Future<Cartdmodel?> readDataOnlyOneRow(int id) async {
//     var dbClient = await dataBases;
//     List<Map<String, dynamic>> maps = await dbClient!.query(
//       "Users",
//       where: "id=?",
//       whereArgs: [id],
//     );

//     if (maps.length > 0) {
//       return Cartdmodel.fromJson(maps.first);
//     } else {
//       return null;
//     }
//   }

// //GetAllData Servises
//   Future<List<NotModel?>> GetDataAll() async {
//     var dbClient = await dataBases;
//     List<Map<String, dynamic>> maps = await dbClient!.query(
//       "notes",
//     );

//     List<NotModel> list = maps.isNotEmpty
//         ? maps.map((productInfo) => NotModel.fromJson(productInfo)).toList()
//         : [];

//     return list;
//   }

// //delete Servises
//   Future<void> DeleteDataOnlyOneRow(int id) async {
//     var dbClient = await dataBases;
//     var maps = await dbClient!.delete(
//       "notes",
//       where: "id = ?",
//       whereArgs: [id],
//     );
//     print("+++++++++++++++++ Hello deleted one   +++++++++++++++++");
//   }
// }
