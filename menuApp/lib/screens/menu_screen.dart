import 'package:flutter/material.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  final List<Product> products = [
    Product(id: '1', name: 'Бургер', price: 5.99, image: 'assets/burger.png'),
    Product(id: '2', name: 'Пицца', price: 8.99, image: 'assets/pizza.png'),
    Product(id: '3', name: 'Салат', price: 4.99, image: 'assets/salad.png'),
    Product(id: '4', name: 'Кола', price: 2.99, image: 'assets/cola.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Меню',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
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
        itemBuilder: (context, index) {
          return _buildProductCard(context, products[index]);
        },
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, Product product) {
    final cart = Provider.of<CartProvider>(context, listen: false);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Column(
        children: [
          Expanded(
            child: Image.asset(product.image, fit: BoxFit.cover),
          ),
          Text(product.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text('\$${product.price.toStringAsFixed(2)}',
              style: TextStyle(color: Colors.green, fontSize: 16)),
          SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {
              cart.addToCart(product);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('${product.name} добавлен в корзину!')));
            },
            child: Text('Добавить'),
          ),
        ],
      ),
    );
  }
}
