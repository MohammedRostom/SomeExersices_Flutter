import 'package:flutter_applicatioaserwerwr/dataBases_help.dart';
import 'package:flutter_applicatioaserwerwr/model/newsModel.dart';
import 'package:get/get.dart';

class cartController extends GetxController {
  bool _IsLOdinDAt = false;
  bool get IsLOdinDAt => _IsLOdinDAt;

  List<Cartdmodel?> _NewListINProductSaved = [];

  List<Cartdmodel?> get NewListINProductSaved => _NewListINProductSaved;
  Future<List<Cartdmodel?>> GetAllProductData() async {
    _IsLOdinDAt = true;
    update();

    var helper = DataBasesHelper.db;
    _NewListINProductSaved = await helper.GetDataAll();
    print("====================>${_NewListINProductSaved.length}");
    _IsLOdinDAt = false;
    getTotalPrise();
    update();

    return _NewListINProductSaved;
  }

  cartController() {
    GetAllProductData();
  }

  Future<void> addProduct(Cartdmodel? cartProduct) async {
    if (_NewListINProductSaved.any(
        (productmodel) => productmodel!.productId == cartProduct!.productId)) {
      return; // Product already exists, so return without adding it
    } else {
      var helper = DataBasesHelper.db;
      await helper.insertDataInUserModel(cartProduct!);
      _NewListINProductSaved.add(cartProduct);
    }
    getTotalPrise();
    update();
  }

  double _totalprice = 0;
  double get totalprice => _totalprice;

  Future<void> getTotalPrise() async {
    // Initialize total price to 0 before calculating
    for (var i = 0; i < _NewListINProductSaved.length; i++) {
      _totalprice += await (double.parse(_NewListINProductSaved[i]!.price!) *
          _NewListINProductSaved[i]!.quntaty!);
    }
    print(_totalprice);
    update();
  }

  void increaseQuintaty(int index) {
    int x = (_NewListINProductSaved[index]!.quntaty!);
    x++;

    print(x);
    _totalprice += double.parse(_NewListINProductSaved[index]!.price!);
    update();
  }

  void decreaseQuintaty(int indwwwex) {
    int x = (_NewListINProductSaved[indwwwex]!.quntaty!);
    x += x;
    print(x);
    _totalprice -= double.parse(_NewListINProductSaved[indwwwex]!.price!);
    update();
  }
}
