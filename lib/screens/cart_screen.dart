import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../models/menu_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Корзина'),
      ),
      body: cart.items.isEmpty
          ? const Center(child: Text('Ваша корзина пуста'))
          : ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                MenuItem item = cart.items[index];
                return ListTile(
                  leading: Image.asset(item.image, width: 50, height: 50),
                  title: Text(item.name),
                  subtitle: Text('${item.price} \$'),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle),
                    onPressed: () => cart.removeItem(item),
                  ),
                );
              },
            ),
      bottomNavigationBar: cart.items.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  cart.clearCart();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Заказ оформлен!')),
                  );
                },
                child: const Text('Оформить заказ'),
              ),
            )
          : null,
    );
  }
}
