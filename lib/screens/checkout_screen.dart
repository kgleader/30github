import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  final double totalAmount;

  const CheckoutScreen({super.key, required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Оплата заказа')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Итого к оплате: \$${totalAmount.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Здесь будет логика оплаты
              },
              child: Text('Перейти к оплате'),
            ),
          ],
        ),
      ),
    );
  }
}
