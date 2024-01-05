import 'package:flutter/foundation.dart';
import 'package:sustainify_hub/models/sell_item.dart';

class ProductsProvider extends ChangeNotifier {
  List<SurplusProduct> _products = [];

  List<SurplusProduct> _myproducts = [];
  List<SurplusProduct> _filteredItems = [];

  List<SurplusProduct> get products =>
      _filteredItems.isNotEmpty ? _filteredItems : _products;
  List<SurplusProduct> get myproducts => _myproducts;

  void sellProduct() {
    for (var product in _myproducts) {
      _products.add(product);
    }
    _myproducts = [];
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
    if (query.isEmpty) {
      _filteredItems = [];
    } else {
      _filteredItems = _products
          .where(
              (item) => item.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
