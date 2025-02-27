import 'package:flutter/material.dart';
import 'package:simple_app/models/cart_item.dart';

class ProductItem extends StatelessWidget {
  final CartItem product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      // другие параметры отображения
    );
  }
}
