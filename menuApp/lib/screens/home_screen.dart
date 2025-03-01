import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';
import '../widgets/product_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    final products = productsData.items;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Меню'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () =>
                Navigator.pushNamed(context, '/cart'), // ✅ Переход в корзину
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // ✅ Было 2, теперь 3 товара в ряд
          childAspectRatio: 0.9, // ✅ Было 0.7 → теперь карточки компактнее
          crossAxisSpacing: 5, // ✅ Было 10, теперь 5
          mainAxisSpacing: 5, // ✅ Было 10, теперь 5
        ),
        itemCount: products.length,
        itemBuilder: (ctx, i) => ProductItem(product: products[i]),
      ),
    );
  }
}
