import 'dart:convert';
import 'package:flutter_applicatioaserwerwr/model/newsModel.dart';
import 'package:http/http.dart';

import '../helper/api.dart';

class AllProductsService {
  Future<List<Post>> getAllProducts() async {
    List<dynamic> data = await Api().get(
        url:
            'https://newsapi.org/v2/everything?q=tesla&from=2023-08-16&sortBy=publishedAt&apiKey=c53536da2cb64c1c88729a1d2caeeab2');

    List<Post> productsList = [];

    for (int i = 0; i < data.length; i++) {
      productsList.add(
        Post.fromJson(data[i]),
      );
    }

    return productsList;
  }
}
