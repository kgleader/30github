import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:flutter/foundation.dart';

class CheckoutScreen extends StatelessWidget {
  final double totalAmount;

  const CheckoutScreen({super.key, required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Оплата заказа')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => UsePaypal(
                  sandboxMode: true, // true - тестовый режим, false - реальный
                  clientId: "ТВОЙ_CLIENT_ID",
                  secretKey: "ТВОЙ_SECRET_KEY",
                  returnURL: "https://example.com/return",
                  cancelURL: "https://example.com/cancel",
                  transactions: [
                    {
                      "amount": {
                        "total": totalAmount.toStringAsFixed(2),
                        "currency": "USD",
                        "details": {
                          "subtotal": totalAmount.toStringAsFixed(2),
                          "shipping": "0",
                          "handling_fee": "0",
                          "tax": "0"
                        }
                      },
                      "description": "Оплата заказа в кафе"
                    }
                  ],
                  note: "Спасибо за покупку!",
                  onSuccess: (Map params) {
                    if (kDebugMode) {
                      print("Оплата успешна: $params");
                    }
                    Navigator.pop(context);
                  },
                  onError: (error) {
                    if (kDebugMode) {
                      print("Ошибка оплаты: $error");
                    }
                  },
                  onCancel: (params) {
                    if (kDebugMode) {
                      print("Оплата отменена: $params");
                    }
                  },
                ),
              ),
            );
          },
          child: const Text("Оплатить через PayPal"),
        ),
      ),
    );
  }
}
