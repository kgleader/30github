import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  final Map<String, Product> _products = {};

  Map<String, Product> get products => _products;

  int get productCount => _products.length; // ✅ Возвращает количество товаров

  void addToCart(Product product) {
    if (product.id.isEmpty) return; // ✅ Проверка на пустой `id`
    _products.putIfAbsent(product.id, () => product);
    notifyListeners();
  }

  void removeItem(String productId) {
    _products.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _products.clear();
    notifyListeners();
  }
}
