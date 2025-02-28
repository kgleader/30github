import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';
import '../widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    final products = productsData.items; // Get the list of products

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length, // Total number of products
      itemBuilder: (ctx, i) =>
          ProductItem(product: products[i]), // Display each product
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two products per row
        childAspectRatio: 3 / 2, // Aspect ratio of each grid item
        crossAxisSpacing: 10, // Space between columns
        mainAxisSpacing: 10, // Space between rows
      ),
    );
  }
}
