import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../controller/news_conroller.dart';
import '../model/newsModel.dart';

class MyWidget extends StatelessWidget {
  MyWidget({
    super.key,
    required this.POST,
  });
  final Post POST;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<news_conroller>(
      builder: (news) {
        return Scaffold(
          body: Column(
            children: [
              Text("${POST.title}"),
              Text("${POST.description}"),
            ],
          ),
        );
      },
    );
  }
}
