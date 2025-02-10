import 'package:flutter/material.dart';
import 'menu_item.dart';

class Cart with ChangeNotifier {
  final List<MenuItem> _items = [];

  List<MenuItem> get items => _items;

  void addItem(MenuItem item) {
    _items.add(item);
    notifyListeners(); // Обновляем UI
  }

  void removeItem(MenuItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  int get itemCount => _items.length;
}
