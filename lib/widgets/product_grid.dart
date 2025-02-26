  // lib/widgets/product_grid.dart
  import 'package:flutter/material.dart';
  import '../models/product.dart';
  import './product_item.dart';

  class ProductGrid extends StatelessWidget {
    final List<Product> loadedProducts = [
      Product(
        id: 'p1',
        title: 'Product 1',
        description: 'Description for Product 1',
        price: 29.99,
        imageUrl: 'https://via.placeholder.com/150',
      ),
      // Add more products as needed
    ];

    @override
    Widget build(BuildContext context) {
      return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: loadedProducts.length,
        itemBuilder: (ctx, i) => ProductItem(
          id: loadedProducts[i].id,
          title
::contentReference[oaicite:0]{index=0}
 
