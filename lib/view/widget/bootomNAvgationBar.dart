import 'package:flutter/material.dart';
import 'package:flutter_applicatioaserwerwr/constans.dart';
import 'package:flutter_applicatioaserwerwr/controller/home_conroler.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

Widget bottomNavigationBar() {
  return GetBuilder<home_conroler>(
    init: home_conroler(),
    builder: (controller) => BottomNavigationBar(
        selectedItemColor: KprimaryColors,
        onTap: (IndexNOw) {
          controller.changselected(IndexNOw);
        },
        currentIndex: controller.Index,
        items: [
          BottomNavigationBarItem(label: "home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: "card_travel", icon: Icon(Icons.card_travel)),
          BottomNavigationBarItem(
              label: "person", icon: Icon(Icons.person_2_rounded)),
        ]),
  );
}
