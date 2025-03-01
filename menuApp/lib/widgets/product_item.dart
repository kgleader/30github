import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          SizedBox(
            height: 120,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                product.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                      Icons.image_not_supported); // ✅ Если фото нет
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4), // ✅ Было 8, уменьшили до 4
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name,
                    style: const TextStyle(fontSize: 14)), // ✅ Было 16
                SizedBox(height: 2), // ✅ Было 4
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                      color: Colors.green, fontSize: 12), // ✅ Было 14
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 4), // ✅ Было 16
              textStyle: const TextStyle(fontSize: 12), // ✅ Было 14
            ),
            onPressed: () {
              cart.addToCart(product);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${product.name} добавлен в корзину!')),
              );
            },
            child: const Text('Добавить'),
          ),
        ],
      ),
    );
  }
}
