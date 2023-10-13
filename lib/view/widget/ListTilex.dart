import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../model/newsModel.dart';
import '../itempos.dart';

class ListTilex extends StatelessWidget {
  const ListTilex({
    super.key,
    required this.newss,
  });

  final Post newss;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        title: Text(newss.title!),
        subtitle: Text(newss.description!),
        onTap: () {
          Get.to(MyWidget(
            POST: newss,
          ));
        },
      ),
    );
  }
}
