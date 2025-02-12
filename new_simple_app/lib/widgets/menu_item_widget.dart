import 'package:flutter/material.dart';
import 'package:simple_app/models/menu_item.dart';

class MenuItemWidget extends StatelessWidget {
  final MenuItem item;

  const MenuItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(item.image, width: 50, height: 50),
      title: Text(item.name),
      subtitle: Text(item.price),
      onTap: () {
        // Бул жерде товарды кошуу же башка логика бар
      },
    );
  }
}
