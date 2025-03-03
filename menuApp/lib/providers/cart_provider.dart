import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  final Map<String, Product> _products = {};

  Map<String, Product> get products => _products;

  int get productCount => _products.length; // ✅ Возвращает количество товаров

  void addToCart(Product product) {
    if (product.id.isEmpty) {
      print("❌ Ошибка: product.id пуст");
      return;
    }

    _products.putIfAbsent(product.id, () {
      print("✅ Продукт добавлен: ${product.name}");
      return product;
    });

    print("📦 Корзина: ${_products.length} товаров");
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
