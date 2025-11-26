import 'package:flutter/material.dart';
import 'package:menu_app/models/cart_item.dart';

class ProductsProvider with ChangeNotifier {
  final List<CartItem> _items = [
    CartItem(
      id: 'p1',
      name: 'DEEP DISH PIZZA cheesy',
      price: 12.99,
      image: 'https://via.placeholder.com/100', // ✅ imageUrl'ду image кылдyk//
      category: 'Food',
      title: 'Delicious Pizza',
      quantity: 1, // ✅ quantity 1ден баштала
      description: 'Tasty cheese pizza with crispy crust',
    ),
    CartItem(
      id: 'p2',
      name: 'SHAURMA Number 1..',
      price: 8.99,
      image: 'https://via.placeholder.com/100',
      category: 'Food',
      title: 'Juicy Beef Burger number',
      quantity: 1,
      description: 'Classic beef burger with fresh lettuce and tomato',
    ),
    CartItem(
      id: 'p3',
      name: 'Chalap Shoro Tan',
      price: 4.99,
      image: 'https://via.placeholder.com/100',
      category: 'Drinks',
      title: 'Hot Coffee',
      quantity: 1,
      description: 'Freshly brewed coffee with rich aroma',
    ),
    CartItem(
      id: 'p4',
      name: 'Soda Gaz voda',
      price: 2.99,
      image: 'https://via.placeholder.com/100',
      category: 'Drinks & beverages',
      title: 'COLD SODA',
      quantity: 1,
      description: 'Refreshing soda with water,
    ),
  ];

  List<CartItem> get items {
    return [..._items]; // ✅ Клоn тизмесин кайтаr
  }

  void addProduct(CartItem product) {
    _items.add(product);
    notifyListeners(); // ✅ UI жаңыртuu
  }

  void removeProduct(String id) {
    _items.removeWhere((product) => product.id == id);
    notifyListeners();
  }
}
