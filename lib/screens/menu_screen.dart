import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../screens/cart_screen.dart';
import '../models/menu_item.dart';

class MenuScreen extends StatelessWidget {
  final List<MenuItem> menuItems = [
    MenuItem(name: 'Чай', price: 2.5, image: 'assets/tea.jpg'),
    MenuItem(name: 'Кофе', price: 3.0, image: 'assets/coffee.jpg'),
    MenuItem(name: 'Пирог', price: 4.0, image: 'assets/pie.jpg'),
  ];

  MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Меню'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartScreen()),
                  );
                },
              ),
              Positioned(
                right: 8,
                top: 8,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.red,
                  child: Text(
                    '${cart.itemCount}',
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          MenuItem item = menuItems[index];

          return ListTile(
            leading: Image.asset(item.image, width: 50, height: 50),
            title: Text(item.name),
            subtitle: Text('${item.price} \$'),
            trailing: ElevatedButton(
              onPressed: () => cart.addItem(item),
              child: const Text('Добавить'),
            ),
          );
        },
      ),
    );
  }
}
