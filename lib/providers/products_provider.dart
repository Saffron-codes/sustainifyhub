import 'package:flutter/foundation.dart';
import 'package:sustainify_hub/models/sell_item.dart';

class ProductsProvider extends ChangeNotifier {
  List<SurplusProduct> _products = [];

  List<SurplusProduct> _myproducts = [];

  List<SurplusProduct> get products => _products;
  List<SurplusProduct> get myproducts => _myproducts;

  void sellProduct() {
    _products = _myproducts;
    notifyListeners();
  }

  void buyProduct(int id) {
    _products.removeAt(id);
    notifyListeners();
  }

  void addMyProducts(SurplusProduct product) {
    _myproducts.add(product);
    notifyListeners();
  }

  void searchProducts(String query) {
    final list = _products;
    if (query.isNotEmpty) {
      _products =
          _products.where((element) => element.name.contains(query)).toList();
      notifyListeners();
    }
    _products = list;
    notifyListeners();
  }
}
