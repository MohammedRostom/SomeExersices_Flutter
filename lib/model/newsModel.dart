import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  String? title;
  String? description;
  String? urlToImage;

  Post({
    required this.title,
    required this.description,
    required this.urlToImage,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        title: json!["title"],
        description: json!["description"],
        urlToImage: json!["urlToImage"],
      );
}

//Userssssssss
class Userssssssss {
  final String Email;
  final String token;

  Userssssssss({required this.Email, required this.token});
}

//ProductModel

class CategoryModel {
  final String? categoryModelList;

  CategoryModel({required this.categoryModelList});

  factory CategoryModel.fromJson(json) {
    return CategoryModel(
      categoryModelList: json["categoryModelList"],
    );
  }
}

//prouctModel
class prouctModel {
  final String? nameProduct;
  final String? descraption;
  final String? price;
  final String? url;
  final String? productId;

  prouctModel({
    required this.nameProduct,
    required this.descraption,
    required this.price,
    required this.url,
    required this.productId,
  });

  factory prouctModel.fromJson(json) {
    return prouctModel(
      nameProduct: json["nameProduct"],
      descraption: json["descraption"],
      price: json["price"],
      url: json["url"],
      productId: json["productId"],
    );
  }
}

class Cartdmodel {
  String? name, descraption, price, productId;
  int? quntaty;
  Cartdmodel(
      {this.quntaty, this.productId, this.name, this.descraption, this.price});

//nOFECTORY no iNTERNET
  Cartdmodel.fromJson(Map<dynamic, dynamic> json) {
    quntaty = json["quntaty"];
    name = json["name"];
    descraption = json["descraption"];
    price = json["price"];
    productId = json["productId"];
  }

  Map<String, dynamic> toMap() {
    return ({
      'quntaty': quntaty,
      'name': name,
      'descraption': descraption,
      'price': price,
      'productId': productId,
    });
  }
}

class NotModel {
  int? id;
  String? title, subTitle;

  NotModel({this.title, this.subTitle, this.id});

//nOFECTORY no iNTERNET
  NotModel.fromJson(Map<dynamic, dynamic> json) {
    id = json["id"];
    title = json["title"];
    subTitle = json["subTitle"];
  }

  Map<String, dynamic> toMap() {
    return ({
      'id': id,
      'title': this.title,
      'subTitle': subTitle,
    });
  }
}
