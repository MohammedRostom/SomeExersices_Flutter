import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_applicatioaserwerwr/model/newsModel.dart';
import 'package:flutter_applicatioaserwerwr/model/newsModel.dart';
import 'package:flutter_applicatioaserwerwr/model/newsModel.dart';
import 'package:flutter_applicatioaserwerwr/view/cartscreen.dart';
import 'package:flutter_applicatioaserwerwr/view/profile_scerrns.dart';
import 'package:get/get.dart';
import '../model/newsModel.dart';
import '../view/homescreen.dart';

class home_conroler extends GetxController {
  int _index = 0;

  bool is_loding = false;
  get Index => _index;

  List<Widget> screens = [HomePage(), cartscreen(), profile_scerrns()];

  void changselected(int islectedIndex) {
    _index = islectedIndex;
    update();
  }

//constrctir?============================================================?
  @override
  void onInit() {
    categoryMethodWithSream();
    GetproductMetodsWithSream();
  }

//with_NOOOOOO Stream
  List<CategoryModel> categoryModelList = [];
  Future<List<CategoryModel>> categoryMethod() async {
    final QuerySnapshot categorySnapshot =
        await FirebaseFirestore.instance.collection("Category").get();
    List<QueryDocumentSnapshot> listOfdoc = categorySnapshot.docs;
    for (int i = 0; i < listOfdoc.length; i++) {
      categoryModelList.add(CategoryModel.fromJson(listOfdoc[i].data()));

      print(listOfdoc.length);
    }
    update();
    return categoryModelList;
  }

  StreamSubscription<QuerySnapshot>? _categorySubscription;
  void categoryMethodWithSream() {
    is_loding = true;
    update();
    final categoryCollection =
        FirebaseFirestore.instance.collection("Category");
    _categorySubscription = categoryCollection.snapshots().listen((snapshot) {
      categoryModelList.clear();

      for (var doc in snapshot.docs) {
        categoryModelList.add(CategoryModel.fromJson(doc.data()));
      }
      update();

      is_loding = false;
      update();
    });
  }

  //GetproductMetods
  StreamSubscription<QuerySnapshot>? _ProductSubscription;
  List<prouctModel> ProdctlistModelList = [];
  void GetproductMetodsWithSream() {
    is_loding = true;
    update();
    final ProdcutCollection = FirebaseFirestore.instance.collection("Product");
    _ProductSubscription = ProdcutCollection.snapshots().listen((snapshot) {
      ProdctlistModelList.clear();

      for (var doc in snapshot.docs) {
        ProdctlistModelList.add(prouctModel.fromJson(doc.data()));
      }
      update();

      is_loding = false;
      update();
    });
  }
}
