import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_item.dart' show CartItem;
import '../providers/cart_provider.dart';
import 'package:simple_app/models/cart_item.dart' as model;
import 'package:simple_app/providers/cart_provider.dart' as provider;


class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<CartItem> menuItems = [
      CartItem(
        id: "P1",
        name: "Бургер",
        price: 5.0,
        image: "assets/images/burger.png",
        category: "Фастфуд",
        description: "Вкусный бургер с говядиной",
        title: '',
        quantity: 0,
      ),
      CartItem(
        name: "Пицца",
        id: "P2",
        price: 8.0,
        image: "assets/images/pizza.png",
        category: "Итальянская кухня",
        description: "Пицца с сыром и пепперони",
        title: '',
        quantity: 0,
      ),
      CartItem(
        name: "Суши",
        price: 12.0,
        image: "assets/images/sushi.png",
        category: "Японская кухня",
        description: "Суши с лососем и авокадо",
        id: '',
        title: '',
        quantity: 0,
      ),
      CartItem(
        name: "Шашлык",
        price: 10.0,
        image: "assets/images/shashlik.png",
        category: "Кавказская кухня",
        description: "Шашлык из свинины",
        id: '',
        title: '',
        quantity: 0,
      ),
      CartItem(
        name: "Салат",
        price: 4.0,
        image: "assets/images/salad.png",
        category: "Здоровая еда",
        description: "Салат с овощами и курицей",
        id: '',
        title: '',
        quantity: 0,
      ),
    ];

    var cart = Provider.of<CartProvider>(context, listen: false).cart.addToCart(product);
(
        menuItems.id, menuItems.title, menuItems.price, menuItems.imageUrl);
    return Scaffold(
      appBar: AppBar(title: Text("Меню")),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return ListTile(
            title: Text(item.name),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart, color: Colors.green),
              onPressed: () {
                cart.addToCart(item); // Корзинага кошуу
              },
            ),
          );
        },
      ),
    );
  }
}
