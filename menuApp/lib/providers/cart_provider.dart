import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  int get itemCount => _items.length;

  double get totalPrice {
    return _items.values
        .fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  List<CartItem> get availableProducts {
    return [
      CartItem(
        id: 'p1',
        name: 'Pizza',
        price: 12.99,
        image:
            'https://upload.wikimedia.org/wikipedia/commons/6/65/Food_icon.svg', // ✅ `imageUrl` эмес, `image`
        category: 'Food',
        title: 'Delicious Pizza',
        quantity: 1,
        description: 'Tasty cheese pizza with crispy crust',
      ),
      CartItem(
        id: 'p2',
        name: 'Burger',
        price: 8.99,
        image:
            'https://upload.wikimedia.org/wikipedia/commons/6/65/Food_icon.svg',
        category: 'Food',
        title: 'Juicy Beef Burger',
        quantity: 1,
        description: 'Classic beef burger with fresh lettuce and tomato',
      ),
    ];
  }

  int get productCount => availableProducts.length;
  void addToCart(CartItem product, String name, double price, String image) {
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id,
        (existingItem) => CartItem(
          id: existingItem.id,
          category: existingItem.category,
          name: existingItem.name,
          title: existingItem.title,
          quantity: existingItem.quantity + 1,
          price: existingItem.price,
          description: existingItem.description,
          image: existingItem.image,
        ),
      );
    } else {
      _items.putIfAbsent(product.id, () => product);
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
