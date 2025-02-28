import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
import '../providers/product.dart';

class MenuItemScreen extends StatelessWidget {
  const MenuItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Меню'),
      ),
      body: ListView.builder(
        itemCount: 10, // Примерное количество элементов
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text('Продукт $index'),
            trailing: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                // Добавляем продукт в корзину
                cartProvider.addToCart(
                    Product(
                        id: '$index',
                        name: 'Продукт $index',
                        price: 10.0,
                        imageUrl:
                            'https://www.southernliving.com/thmb/dejpntItXo5OywZWLVYhQAbmxPA=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/roasted-garlic-183885010-5834b7013df78c6f6a6cc331.jpg'), // Создадим продукт

                    'Продукт $index',
                    10.0); // Добавим название и цену продукта
              },
            ),
          );
        },
      ),
    );
  }
}
