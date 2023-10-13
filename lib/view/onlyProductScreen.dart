import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_applicatioaserwerwr/constans.dart';
import 'package:flutter_applicatioaserwerwr/controller/cartController.dart';
import 'package:flutter_applicatioaserwerwr/model/newsModel.dart';
import 'package:flutter_applicatioaserwerwr/view/widget/custombtn.dart';
import 'package:get/get.dart';

class onlyProductScreen extends StatelessWidget {
  onlyProductScreen({super.key, this.prodcutInfo});

  prouctModel? prodcutInfo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            height: 400,
            color: KprimaryColors,
          ),
          Text("${prodcutInfo!.nameProduct}"),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text("${prodcutInfo!.descraption}"),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${prodcutInfo!.price}"),
                  GetBuilder<cartController>(
                    init: cartController(),
                    builder: (controller) => Container(
                        width: 100,
                        child: Custembuutton(
                            ColorBtn: KprimaryColors,
                            SizeText: 12,
                            YText: "Card",
                            onPressed: () {
                              controller.addProduct(Cartdmodel(
                                name: prodcutInfo!.nameProduct,
                                productId: prodcutInfo!.productId!,
                                descraption: prodcutInfo!.descraption,
                                price: prodcutInfo!.price,
                                quntaty: 1,
                              ));
                            })),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
