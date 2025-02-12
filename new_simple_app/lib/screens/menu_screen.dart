import 'package:flutter/material.dart';
import 'package:simple_app/models/menu_item.dart';
import 'package:simple_app/widgets/menu_item_widget.dart';

// ignore: use_key_in_widget_constructors
class MenuScreen extends StatelessWidget {
  final List<MenuItem> menuItems = [
    MenuItem(name: 'Кофе', price: '150 сом', image: 'assets/coffee.jpg'),
    MenuItem(name: 'Чай', price: '100 сом', image: 'assets/tea.jpg'),
    MenuItem(name: 'Пирог', price: '120 сом', image: 'assets/pie.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu of restaurant "Dolphin'),
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          return MenuItemWidget(item: menuItems[index]);
        },
      ),
    );
  }
}
