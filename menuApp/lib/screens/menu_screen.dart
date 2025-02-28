import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_app/providers/product.dart';
import '../providers/cart_provider.dart'; // Путь к вашему CartProvider

class MenuScreen extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'id': 'P1',
      'name': 'Coffee',
      'price': 12.99,
      'image': 'assets/images/coffee.jpg', // Путь к изображению
    },
    {
      'id': 'P2',
      'name': 'Tea',
      'price': 10.99,
      'image': 'assets/images/tea.jpg', // Путь к изображению
    },
    {
      'id': 'P3',
      'name': 'Pie',
      'price': 5.99,
      'image': 'assets/images/pie.jpg', // Путь к изображению
    },
    {
      'id': 'P4',
      'name': 'Pizza Slice',
      'price': 2.99,
      'image': 'assets/images/pizza.jpg', // Путь к изображению
    },
    // Добавьте другие продукты
  ];

  MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Меню'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          )
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (ctx, i) => ProductItem(
          id: products[i]['id'],
          name: products[i]['name'],
          price: products[i]['price'],
          image: products[i]['image'],
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String id;
  final String name;
  final double price;
  final String image;

  const ProductItem({
    super.key,
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () => cart.addToCart(
            id as Product, name, price), // Передаем id, name и price
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.asset(image, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('\$${price.toStringAsFixed(2)}',
                      style: TextStyle(color: Colors.green)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
