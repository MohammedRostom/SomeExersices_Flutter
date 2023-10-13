import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_applicatioaserwerwr/view/homescreen.dart';
import 'package:get/get.dart';

import '../model/newsModel.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? username;
  String? password;
  bool isLoading = false;

  Future<dynamic> login() async {
    UserCredential? auer;
    try {
      // Start loading
      isLoading = true;
      update();

      auer = await _auth.signInWithEmailAndPassword(
          email: username!, password: password!);
      Userssssssss info =
          Userssssssss(Email: auer.user!.email!, token: auer.user!.uid);
      // Stop loading
      await addUserInfoToFirestore(info); // Save user info to Firestore

      isLoading = false;
      update();

      Get.snackbar("تم التسجيل بنجاح", "Welcome",
          duration: Duration(seconds: 1));
      Get.offAll(HomePage(
        name: info,
      ));
    } catch (e) {
      // Stop loading
      isLoading = false;
      update();

      Get.snackbar("Error try Again", e.toString());
    }
    return Userssssssss;
  }

  Future<dynamic> addUserInfoToFirestore(Userssssssss user) async {
    try {
      await FirebaseFirestore.instance
          .collection("sers")
          .add({"email": user.Email, "token": user.token});
    } catch (e) {
      print("Error adding user info to Firestore: $e");
    }
  }
}
