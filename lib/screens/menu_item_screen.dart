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
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('\$${item.price.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Возвращаемся назад в меню
              },
              child: Text('Назад'),
            ),
          ],
        ),
      ),
    );
  }
}
