import 'package:flutter/material.dart';
import 'package:flutter_applicatioaserwerwr/controller/home_conroler.dart';
import 'package:flutter_applicatioaserwerwr/view/cartscreen.dart';
import 'package:flutter_applicatioaserwerwr/view/homescreen.dart';
import 'package:flutter_applicatioaserwerwr/view/profile_scerrns.dart';
import 'package:get/get.dart';

import 'widget/bootomNAvgationBar.dart';

class layoutscrens extends StatelessWidget {
  layoutscrens({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<home_conroler>(
        builder: (conroler) => Scaffold(
            bottomNavigationBar: bottomNavigationBar(),
            body: conroler.screens[conroler.Index]));
  }
}
