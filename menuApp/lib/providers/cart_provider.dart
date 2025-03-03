import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  int get itemCount => _items.length; // ✅ Корзинадагы товарлардын саны

  double get totalPrice {
    return _items.values
        .fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  void addToCart(String productId, String name, double price, String image) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingItem) => CartItem(
          id: existingItem.id,
          category: "Default",
          name: existingItem.name,
          title: existingItem.title,
          quantity:
              existingItem.quantity + 1, // ✅ Бири кошулганда санын көбөйтүү
          price: existingItem.price,
          description: existingItem.description,
          image: existingItem.image, imageUrl: '',
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: productId,
          category: "Default",
          name: name,
          title: name,
          quantity: 1,
          price: price,
          description: "",
          image: image,
          imageUrl: '',
        ),
      );
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
