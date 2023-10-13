import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_applicatioaserwerwr/constans.dart';
import 'package:flutter_applicatioaserwerwr/controller/cartController.dart';
import 'package:flutter_applicatioaserwerwr/model/newsModel.dart';
import 'package:flutter_applicatioaserwerwr/view/widget/custombtn.dart';
import 'package:get/get.dart';

class cartscreen extends StatelessWidget {
  const cartscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<cartController>(
      init: cartController(),
      builder: (controller) => Column(
        children: [
          Expanded(
            child: controller.IsLOdinDAt == true
                ? Center(child: CircularProgressIndicator())
                : ListView.separated(
                    itemBuilder: (_, index) => customListile(
                          controllerf: controller,
                          model: controller.NewListINProductSaved[index]!,
                          indedx: index,
                        ),
                    separatorBuilder: (_, index) => SizedBox(
                          height: 10,
                        ),
                    itemCount: controller.NewListINProductSaved.length),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GetBuilder<cartController>(
                init: cartController(),
                builder: (controller) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Total"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${controller.totalprice}"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: 155,
                    child: Custembuutton(
                        ColorBtn: KprimaryColors,
                        SizeText: 12,
                        YText: "CheackOut",
                        onPressed: () {})),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}

class customListile extends StatelessWidget {
  const customListile({
    super.key,
    required this.model,
    required this.indedx,
    required this.controllerf,
  });
  final Cartdmodel model;
  final int indedx;
  final cartController controllerf;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 45,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        GetBuilder<cartController>(
          init: cartController(),
          builder: (cc) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${model.name}"),
              Text("${model.price}"),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        cc.increaseQuintaty(indedx);
                      },
                      child: Text("+")),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                      "${controllerf.NewListINProductSaved[indedx]!.quntaty!.toString()}"),
                  SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        cc.decreaseQuintaty(indedx);
                      },
                      child: Text("-"))
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
