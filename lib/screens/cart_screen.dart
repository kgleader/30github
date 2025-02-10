import 'package:flutter/material.dart';
import 'checkout_screen.dart'; // Импорт экрана оплаты

class CartScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems; // Список товаров в корзине
  final double cartTotal; // Общая сумма заказа

  CartScreen({required this.cartItems, required this.cartTotal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Корзина')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  leading: Image.asset(item['image'], width: 50, height: 50),
                  title: Text(item['name']),
                  subtitle: Text('\$${item['price']}'),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Итого: \$${cartTotal.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckoutScreen(totalAmount: cartTotal),
                ),
              );
            },
            child: Text('Оформить заказ'),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
