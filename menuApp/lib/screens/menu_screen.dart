import 'package:flutter/material.dart';
import '../widgets/menu_item_widget.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  MenuScreenState createState() => MenuScreenState();
}

class MenuScreenState extends State<MenuScreen> {
  String selectedCategory = "ВСЕ";

  final List<String> categories = ["ВСЕ", "ЧАЙ", "КОФЕ", "Десерты"];
  final List<CartItem> items = [
    CartItem(
        name: "Ч",
        price: 1.99,
        image: "assets/tea.jpg",
        category: "Чай",
        description: "кусный чай. Состав: чайные листья, лимон."),
    CartItem(
        name: "Кофе",
        price: 2.99,
        image: "assets/coffee.jpg",
        category: "COFFEE",
        description: "Ароматный кофе. Состав: кофейные зерна, вода."),
    CartItem(
        name: "Пирог",
        price: 3.99,
        image: "assets/pie.jpg",
        category: "Десерты",
        description: "Сладкий пирог. Состав: мука, сахар, яблоки."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: selectedCategory,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue!;
                });
              },
              items: categories.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: ListView(
              children: items
                  .where((item) =>
                      selectedCategory == "Все" ||
                      item.category == selectedCategory)
                  .map((item) => MenuItemWidget(item: item))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
