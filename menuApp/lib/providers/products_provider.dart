import 'package:flutter/material.dart';
import 'package:simple_app/models/cart_item.dart'; // Путь к файлу модели CartItem

class ProductsProvider with ChangeNotifier {
  final List<CartItem> _items = []; // Инициализация пустого списка продуктов

  List<CartItem> get items =>
      [..._items]; // Геттер для получения копии списка продуктов

  void addToCart(CartItem product) {
    _items.add(product); // Добавление продукта в список
    notifyListeners(); // Уведомление слушателей об изменении
  }
}
