import 'package:flutter/material.dart';
import 'cart_item.dart';

class Cart extends ChangeNotifier {
  final List<CartItem> items = [];

  List<CartItem> get cartItems => items;

  void addItem(CartItem item) {
    items.add(item);
    notifyListeners();
  }

  void removeFromCart(CartItem item) {
    items.remove(item);
    notifyListeners();
  }

  void addToCart(CartItem item) {
    items.add(item);
  }
}
