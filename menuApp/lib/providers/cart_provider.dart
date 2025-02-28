import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  final Map<String, int> _items = {};
  final Map<String, Product> _products = {};

  Map<String, int> get items => _items;
  Map<String, Product> get products => _products;

  void addToCart(Product product) {
    if (_items.containsKey(product.id)) {
      _items[product.id] = _items[product.id]! + 1;
    } else {
      _items[product.id] = 1;
      _products[product.id] = product;
    }
    notifyListeners();
  }

  void removeFromCart(String productId) {
    if (_items.containsKey(productId)) {
      _items[productId] = _items[productId]! - 1;
      if (_items[productId] == 0) {
        _items.remove(productId);
        _products.remove(productId);
      }
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    _products.clear();
    notifyListeners();
  }

  double getTotalPrice() {
    double total = 0.0;
    _items.forEach((id, quantity) {
      total += _products[id]!.price * quantity;
    });
    return total;
  }
}
