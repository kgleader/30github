import 'package:flutter/material.dart';
import 'package:simple_app/models/cart_item.dart';

class ProductsProvider with ChangeNotifier {
  final List<CartItem> _items = [...]; // Список продуктов

  List<CartItem> get items => [...];

  void addProduct(CartItem product) {
    _items.add(product);
    notifyListeners();
  }
}
