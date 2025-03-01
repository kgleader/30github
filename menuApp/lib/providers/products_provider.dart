import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductsProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(
        id: 'P1',
        name: 'Coffee',
        price: 12.99,
        imageUrl: 'assets/images/coffee.jpg'),
    Product(
        id: 'P2', name: 'Tea', price: 10.99, imageUrl: 'assets/images/tea.jpg'),
    Product(
        id: 'P3', name: 'Pie', price: 5.99, imageUrl: 'assets/images/pie.jpg'),
    Product(
        id: 'P4',
        name: 'Pizza',
        price: 2.99,
        imageUrl: 'assets/images/pizza.jpg'),
  ];

  List<Product> get items => [..._items]; // ✅ Гарантируем, что список не `null`
}
