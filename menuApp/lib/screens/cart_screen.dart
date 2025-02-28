import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key}); // Убираем параметр 'cart'

  @override
  Widget build(BuildContext context) {
    // Получаем CartProvider
    final cartProvider = Provider.of<CartProvider>(context);

    // Получаем список продуктов из корзины
    final cartProducts = cartProvider.products;

    return Scaffold(
      appBar: AppBar(
        title: Text('Корзина'),
      ),
      body: cartProducts.isEmpty
          ? Center(
              child: Text('Корзина пуста!')) // Сообщение, если корзина пустая
          : ListView.builder(
              itemCount: cartProducts.length,
              itemBuilder: (ctx, index) {
                final product = cartProducts.values.toList()[index];

                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('\$${product.price}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      // Удалить продукт из корзины
                      cartProvider.removeItem(product.id);
                    },
                  ),
                );
              },
            ),
    );
  }
}
