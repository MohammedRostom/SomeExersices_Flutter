// import 'package:flutter/material.dart';
// import 'package:flutter_applicatioaserwerwr/model/newsModel.dart';
// import 'package:flutter_applicatioaserwerwr/services/cart_databases_helper.dart';
// import 'package:get/get.dart';

// class note_viewContrloller extends GetxController {
//   GlobalKey<FormState> Key = GlobalKey();
//   int? id ;
//   String? title, subtitle;

//   List<NotModel?> AllNoteList = [];
//   Future<List<NotModel?>> GetAllProductData() async {
//     var helper = cart_databases_helper.db;
//     List<NotModel?> _allNoteList = await helper.GetDataAll();
//     AllNoteList = _allNoteList;
//     update();
//     print("====================>${_allNoteList.length}");

//     return AllNoteList;
//   }

//   note_viewContrloller() {
//     GetAllProductData();
//   }

// //insert note
//   Future<void> addNote(NotModel? Note) async {
//     var helper = cart_databases_helper.db;
//     await helper.insertDataInNotModel(Note!);
//     GetAllProductData();
//     update();
//   }

//   Future<void> deleate(int id) async {
//     var helper = cart_databases_helper.db;
//     await helper.DeleteDataOnlyOneRow(id);
//     GetAllProductData();
//     update();
//   }

//   Future<void> UpdateNote(NotModel? Onte) async {
//     var helper = cart_databases_helper.db;
//     await helper.UpdattDataInNotModel(Onte!);
//     GetAllProductData();
//     update();
//   }
// }
