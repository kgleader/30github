import 'package:flutter/material.dart';
import 'package:simple_app/providers/product.dart';

class CartProvider with ChangeNotifier {
  final Map<String, Product> _products = {}; // Хранение продуктов

  // Геттер для получения продуктов
  Map<String, Product> get products => _products;

  void addToCart(Product product) {
    if (!_products.containsKey(product.id)) {
      _products[product.id] = product;
    }
    notifyListeners();
  }

  void removeFromCart(String productId) {
    _products.remove(productId);
    notifyListeners();
  }
}
