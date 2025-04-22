import 'package:flutter/material.dart';
import 'package:menu_app/models/cart_item.dart';

class ProductsProvider with ChangeNotifier {
  final List<CartItem> _items = [
    CartItem(
      id: 'p1',
      name: 'Pizza',
      price: 12.99,
      image: 'https://via.placeholder.com/100', // ✅ imageUrl'ду image кылдык
      category: 'Food',
      title: 'Delicious Pizza',
      quantity: 1, // ✅ quantity 1ден башталат
      description: 'Tasty cheese pizza with crispy crust',
    ),
    CartItem(
      id: 'p2',
      name: 'Shaurma',
      price: 8.99,
      image: 'https://via.placeholder.com/100',
      category: 'Food',
      title: 'Juicy Beef Burger',
      quantity: 1,
      description: 'Classic beef burger with fresh lettuce and tomato',
    ),
    CartItem(
      id: 'p3',
      name: 'Chalap',
      price: 4.99,
      image: 'https://via.placeholder.com/100',
      category: 'Drinks',
      title: 'Hot Coffee',
      quantity: 1,
      description: 'Freshly brewed coffee with rich aroma',
    ),
    CartItem(
      id: 'p4',
      name: 'Soda',
      price: 2.99,
      image: 'https://via.placeholder.com/100',
      category: 'Drinks',
      title: 'Cold Soda',
      quantity: 1,
      description: 'Refreshing soda with water,
    ),
  ];

  List<CartItem> get items {
    return [..._items]; // ✅ Клон тизмесин кайтарат
  }

  void addProduct(CartItem product) {
    _items.add(product);
    notifyListeners(); // ✅ UI жаңыртуу
  }

  void removeProduct(String id) {
    _items.removeWhere((product) => product.id == id);
    notifyListeners();
  }
}
