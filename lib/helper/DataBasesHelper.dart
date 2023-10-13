// import 'dart:async';
// import 'package:flutter_applicatioaserwerwr/model/newsModel.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// class DataBasesHelper {
//   DataBasesHelper._();
//   static final DataBasesHelper db = DataBasesHelper._();

//   static Database? _dataBases;
//   Future<Database?> get dataBases async {
//     if (_dataBases == null) {
//       _dataBases = await initializeDatabaseMethod();
//     }
//     return _dataBases;
//   }

//   Future<Database> initializeDatabaseMethod() async {
//     String path = join(await getDatabasesPath(), "database.db");
//     Database myData = await openDatabase(path, version: 1, onCreate: onCereate);

//     return myData;
//   }

//   Future<void> onCereate(Database db, int version) async {
//     await db.execute('''CREATE TABLE product 
//         (
//         id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL ,
//          name TEXT ,
//          descraption TEXT,
//          price TEXT,
//          quntaty INTEGER,
         
//          )''');
//     print("+++++++++++++++++ Table Created notes +++++++++++++++++");
//   }

// //InsrtData in table  with modele Servises
//   Future<Cartdmodel?> insertDataInUserModel(Cartdmodel CCartdmodel) async {
//     var dbClient = await dataBases;
//     await dbClient!.insert("product", CCartdmodel.toMap(),
//         conflictAlgorithm: ConflictAlgorithm.replace);
//     print("+++++++++++++++++${CCartdmodel.toMap()} +++++++++++++++++");

//     return CCartdmodel;
//   }

//   // Future<Cartdmodel?> UpdattDataInUserModel(Cartdmodel user) async {
//   //   var dbClient = await dataBases;
//   //   await dbClient!.update(
//   //     "Users",
//   //     user.toMap(),
//   //     where: "id=?",
//   //     whereArgs: [user.Id],
//   //   );
//   //   print("+++++++++++++++++ Hello Updated +++++++++++++++++");
//   // }

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
//   Future<List<Cartdmodel?>> GetDataAll() async {
//     var dbClient = await dataBases;
//     List<Map<String, dynamic>> maps = await dbClient!.query(
//       "product",
//     );

//     List<Cartdmodel> list = maps.isNotEmpty
//         ? maps.map((productInfo) => Cartdmodel.fromJson(productInfo)).toList()
//         : [];

//     return list;
//   }

// //delete Servises
//   Future<void> DeleteDataOnlyOneRow(int id) async {
//     var dbClient = await dataBases;
//     List<Map<String, dynamic>> maps = await dbClient!.query(
//       "product",
//       where: "id = ?",
//       whereArgs: [id],
//     );
//     print("+++++++++++++++++ Hello deleted one   +++++++++++++++++");
//   }
// }
