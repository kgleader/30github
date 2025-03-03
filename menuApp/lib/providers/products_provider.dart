import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductsProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      name: 'Pizza',
      price: 12.99,
      imageUrl: 'https://via.placeholder.com/100',
    ),
    Product(
      id: 'p2',
      name: 'Burger',
      price: 8.99,
      imageUrl: 'https://via.placeholder.com/100',
    ),
    Product(
      id: 'p3',
      name: 'Coffee',
      price: 4.99,
      imageUrl: 'https://via.placeholder.com/100',
    ),
    Product(
      id: 'p4',
      name: 'Soda',
      price: 2.99,
      imageUrl: 'https://via.placeholder.com/100',
    ),
  ];

  List<Product> get items {
    return [..._items]; // Клон тизмесин кайтарат
  }
}
