import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import '../screens/product_details_screen.dart';

class MenuItemWidget extends StatelessWidget {
  final MenuItem item;

  const MenuItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(item.name),
        subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
        leading:
            Image.asset(item.image, width: 50, height: 50, fit: BoxFit.cover),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(item: item),
            ),
          );
        },
      ),
    );
  }
}
