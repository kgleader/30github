import 'package:flutter/material.dart';
import '../models/menu_item.dart';

class MenuItemScreen extends StatelessWidget {
  final MenuItem item;

  const MenuItemScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.name)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(item.name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('\$${item.price.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Возвращаемся назад в меню
              },
              child: const Text('Назад'),
            ),
          ],
        ),
      ),
    );
  }
}
