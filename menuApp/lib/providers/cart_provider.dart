import 'package:flutter/material.dart';
import 'product.dart';

class CartProvider with ChangeNotifier {
  final Map<String, Product> _products = {};

  Map<String, Product> get products => _products;

  get itemCount => null;

  get productCount => null;

  void addToCart(Product product, String name, double price) {
    if (!_products.containsKey(product.id)) {
      _products[product.id] = product;
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _products.remove(productId);
    notifyListeners();
  }
}
