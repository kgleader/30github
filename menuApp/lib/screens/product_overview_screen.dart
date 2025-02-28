import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import 'package:badges/badges.dart' as badges;
import '../widgets/product_grid.dart';
import './cart_screen.dart';

class ProductOverviewScreen extends StatelessWidget {
  const ProductOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          Consumer<CartProvider>(
            builder: (_, cart, ch) => badges.Badge(
              badgeContent: Text(
                cart.productCount.toString(),
                style: TextStyle(color: Colors.white),
              ),
              badgeStyle: badges.BadgeStyle(
                shape: badges.BadgeShape.circle, // Пример оформления бейджа
                padding: EdgeInsets.all(6), // Устанавливаем отступ
                badgeColor: Theme.of(context)
                    .colorScheme
                    .secondary, // Используем доступный параметр
                elevation: 0, // Убираем тень
              ),
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          CartScreen(), // Убираем параметр 'cart'
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      body: ProductGrid(),
    );
  }
}
