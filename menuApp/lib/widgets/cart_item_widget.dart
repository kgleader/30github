import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final String title;
  final double price;
  final int quantity;

  const CartItemWidget({
    super.key,
    required this.title,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(title),
        subtitle: Text('Quantity: $quantity'),
        trailing: Text('\$${(price * quantity).toStringAsFixed(2)}'),
      ),
    );
  }
}
