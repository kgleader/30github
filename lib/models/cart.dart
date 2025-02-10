import 'package:flutter/material.dart';
import 'menu_item.dart';

class Cart with ChangeNotifier {
  int get itemCount {
    // return the number of items in the cart
    return _items.length;
  }

  final List<MenuItem> _items = [];

  List<MenuItem> get items => _items;

  void addItem(MenuItem item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(MenuItem item) {
    _items.remove(item);
    notifyListeners();
  }

  double get totalPrice {
    return _items.fold(0, (sum, item) => sum + item.price);
  }
}
