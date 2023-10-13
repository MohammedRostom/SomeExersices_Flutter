import 'package:flutter/material.dart';
import 'package:flutter_applicatioaserwerwr/model/newsModel.dart';
import 'package:flutter_applicatioaserwerwr/view/onlyProductScreen.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';

class category extends StatelessWidget {
  const category({
    super.key,
    this.ctegoryModelm,
  });

  final CategoryModel? ctegoryModelm;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
          decoration: BoxDecoration(color: Colors.red),
          child: Text("${ctegoryModelm!.categoryModelList}")),
    );
  }
}

class productItem extends StatelessWidget {
  const productItem({
    super.key,
    this.productinf,
  });

  final prouctModel? productinf;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(onlyProductScreen(prodcutInfo: productinf));
      },
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage("${productinf!.url}"),
            radius: 100,
          ),
          Text("${productinf!.nameProduct}")
        ],
      ),
    );
  }
}
