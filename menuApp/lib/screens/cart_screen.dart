import 'package:flutter/material.dart';
import '../providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Корзина')),
      body: cart.items.isEmpty
          ? Center(child: Text('Корзина пуста!'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      String productId = cart.items.keys.elementAt(index);
                      int quantity = cart.items[productId]!;
                      var product = cart.products[productId]!;

                      return ListTile(
                        leading: Image.asset(product.image, width: 50),
                        title: Text(product.name),
                        subtitle: Text(
                            '\$${product.price.toStringAsFixed(2)} x $quantity'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () => cart.removeFromCart(productId),
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () => cart.addToCart(product),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                          'Итого: \$${cart.getTotalPrice().toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: cart.items.isEmpty
                            ? null
                            : () {
                                cart.clearCart();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Заказ оформлен!')));
                              },
                        child: Text('Оформить заказ'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
