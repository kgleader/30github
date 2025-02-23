import 'package:flutter/material.dart';
import 'menu_item.dart';

class Cart extends ChangeNotifier {
  final List<MenuItem> items = [];

  List<MenuItem> get cartItems => items;

  void addItem(MenuItem item) {
    items.add(item);
    notifyListeners();
  }

  void removeFromCart(MenuItem item) {
    items.remove(item);
    notifyListeners();
  }

  void addToCart(MenuItem item) {
    items.add(item);
  }
}
