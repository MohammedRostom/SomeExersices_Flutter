import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/news_conroller.dart';
import '../model/newsModel.dart';
import 'widget/ListTilex.dart';

class MyNews extends StatelessWidget {
  MyNews({Key? key}) : super(key: key);

  final news_conroller news = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<news_conroller>(
      builder: (news) {
        return Scaffold(
          appBar: AppBar(),
          body: FutureBuilder<List<Post>>(
            future: news.GetElementes(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                List<Post> newsList = snapshot.data!;
                return ListView.builder(
                  itemCount: newsList.length,
                  itemBuilder: (context, index) {
                    return ListTilex(newss: newsList[index]);
                  },
                );
              } else {
                return Text('No data available');
              }
            },
          ),
        );
      },
    );
  }
}
