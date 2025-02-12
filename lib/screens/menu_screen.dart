import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import '../widgets/menu_item_widget.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  MenuScreenState createState() => MenuScreenState();
}

class MenuScreenState extends State<MenuScreen> {
  String selectedCategory = "Все";

  final List<String> categories = ["Все", "Чай", "Кофе", "Десерты"];
  final List<MenuItem> items = [
    MenuItem(
        name: "Чай",
        price: 1.99,
        image: "assets/tea.jpg",
        category: "Чай",
        description: "Вкусный чай. Состав: чайные листья, лимон."),
    MenuItem(
        name: "Кофе",
        price: 2.99,
        image: "assets/coffee.jpg",
        category: "Кофе",
        description: "Ароматный кофе. Состав: кофейные зерна, вода."),
    MenuItem(
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
        title: Text('Меню'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
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
