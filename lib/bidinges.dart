import 'package:flutter_applicatioaserwerwr/controller/cartController.dart';
import 'package:flutter_applicatioaserwerwr/controller/home_conroler.dart';
import 'package:flutter_applicatioaserwerwr/controller/note_viewContrloller.dart';
import 'package:get/get.dart';

import 'controller/Auth_controler.dart';

class bidinges extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => home_conroler(), fenix: true);
    Get.lazyPut(() => cartController(), fenix: true);
    // Get.lazyPut(() => note_viewContrloller(), fenix: true);
  }
}
