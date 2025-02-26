import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../models/cart_item.dart' show CartItem;
import '../provider/cart_provider.dart';

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
        quantity: null,
      ),
      CartItem(
        name: "Пицца",
        id: "P2",
        price: 8.0,
        image: "assets/images/pizza.png",
        category: "Итальянская кухня",
        description: "Пицца с сыром и пепперони",
        title: '',
        quantity: null,
      ),
      CartItem(
        name: "Суши",
        price: 12.0,
        image: "assets/images/sushi.png",
        category: "Японская кухня",
        description: "Суши с лососем и авокадо",
        id: '',
        title: '',
        quantity: null,
      ),
      CartItem(
        name: "Шашлык",
        price: 10.0,
        image: "assets/images/shashlik.png",
        category: "Кавказская кухня",
        description: "Шашлык из свинины",
        id: '',
        title: '',
        quantity: null,
      ),
      CartItem(
        name: "Салат",
        price: 4.0,
        image: "assets/images/salad.png",
        category: "Здоровая еда",
        description: "Салат с овощами и курицей",
        id: '',
        title: '',
        quantity: null,
      ),
    ];

    var cart = Provider.of<CartProvider>(context, listen: false)
        .addItem(product.id, product.title, product.price, product.imageUrl);
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
