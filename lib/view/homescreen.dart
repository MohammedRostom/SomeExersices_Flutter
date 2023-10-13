import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_applicatioaserwerwr/constans.dart';
import 'package:flutter_applicatioaserwerwr/controller/home_conroler.dart';
import 'package:flutter_applicatioaserwerwr/view/widget/CustomFormFild.dart';
import 'package:flutter_applicatioaserwerwr/view/widget/bootomNAvgationBar.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../controller/Auth_controler.dart';
import '../model/newsModel.dart';
import 'widget/productitem.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key, this.name});
  Userssssssss? name;
  @override
  final FirebaseAuth sds = FirebaseAuth.instance;
  Widget build(BuildContext context) {
    return GetBuilder<home_conroler>(
      init: home_conroler(),
      builder: (controller) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  child: CustomFormFild(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'search',
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SingleChildScrollView(
                  child: controller.is_loding == true
                      ? const CircularProgressIndicator()
                      : Container(
                          width: double.maxFinite,
                          height: 70,
                          child: ListView.separated(
                              itemCount: controller.categoryModelList.length,
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (_, index) => const SizedBox(
                                    width: 15,
                                  ),
                              itemBuilder: (_, index) => category(
                                    ctegoryModelm:
                                        controller.categoryModelList[index],
                                  ))),
                ),
                const SizedBox(
                  height: 120,
                ),
                SingleChildScrollView(
                  child: controller.is_loding == true
                      ? const Center(child: CircularProgressIndicator())
                      : Container(
                          width: double.maxFinite,
                          height: 250,
                          child: ListView.separated(
                              itemCount: controller.ProdctlistModelList.length,
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (_, index) => const SizedBox(
                                    width: 15,
                                  ),
                              itemBuilder: (_, index) => productItem(
                                    productinf:
                                        controller.ProdctlistModelList[index],
                                  ))),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
