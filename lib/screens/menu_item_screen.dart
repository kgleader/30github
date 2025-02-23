import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../models/menu_item.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<MenuItem> menuItems = [
      MenuItem(
        name: "Бургер",
        price: 5.0,
        image: "assets/images/burger.png",
        category: "Фастфуд",
        description: "Вкусный бургер с говядиной",
      ),
      MenuItem(
        name: "Пицца",
        price: 8.0,
        image: "assets/images/pizza.png",
        category: "Итальянская кухня",
        description: "Пицца с сыром и пепперони",
      ),
      MenuItem(
        name: "Суши",
        price: 12.0,
        image: "assets/images/sushi.png",
        category: "Японская кухня",
        description: "Суши с лососем и авокадо",
      ),
      MenuItem(
        name: "Шашлык",
        price: 10.0,
        image: "assets/images/shashlik.png",
        category: "Кавказская кухня",
        description: "Шашлык из свинины",
      ),
      MenuItem(
        name: "Салат",
        price: 4.0,
        image: "assets/images/salad.png",
        category: "Здоровая еда",
        description: "Салат с овощами и курицей",
      ),
    ];

    var cart = Provider.of<Cart>(context, listen: false);

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
