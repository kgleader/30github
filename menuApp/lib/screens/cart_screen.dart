import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final cartItems =
        cart.products.values.toList(); // ✅ Получаем список товаров

    return Scaffold(
      appBar: AppBar(title: const Text('Корзина')),
      body: cartItems.isEmpty
          ? const Center(child: Text('Корзина пуста')) // ✅ Если пусто
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (ctx, i) {
                final item = cartItems[i];
                return ListTile(
                  leading:
                      Image.asset(item.imageUrl, width: 50), // ✅ Фото товара
                  title: Text(item.name),
                  subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      cart.removeItem(item.id); // ✅ Удаление товара
                    },
                  ),
                );
              },
            ),
      bottomNavigationBar: cartItems.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  cart.clearCart(); // ✅ Очистка корзины
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Корзина очищена!')),
                  );
                },
                child: const Text('Очистить корзину'),
              ),
            )
          : null,
    );
  }
}
