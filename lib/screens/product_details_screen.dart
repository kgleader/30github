import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../models/menu_item.dart';

class ProductDetailsScreen extends StatelessWidget {
  final MenuItem item;

  const ProductDetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text(item.name)),
      body: Column(
        children: [
          Image.asset(item.image, height: 200, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(item.description,
                    style: const TextStyle(fontSize: 16, color: Colors.grey)),
                const SizedBox(height: 8),
                Text("\$${item.price}",
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.green)),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    cart.addItem(item);
                    Navigator.pop(context);
                  },
                  child: const Text("Добавить в корзину"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
