import 'package:flutter/material.dart';
import '../models/cart.dart';
import '../models/cart_item.dart';

class CartScreen extends StatelessWidget {
  final Cart cart;

  const CartScreen({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Cart")),
      body: ListView.builder(
        itemCount: cart.cartItems.length,
        itemBuilder: (context, index) {
          final item = cart.cartItems[index];
          return ListTile(
            title: Text(item as String), // Тамактын аты
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                cart.removeFromCart(item); // Корзинадан жок кылуу
              },
            ),
          );
        },
      ),
    );
  }
}
