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
                    position: badges.BadgePosition.topEnd(
                        top: 0, end: 3), // ✅ Размещаем бейдж
                    badgeContent: Text(
                      cart.productCount.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    showBadge: cart.productCount >
                        0, // ✅ Скрываем бейдж, если корзина пустая
                    child: IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const CartScreen()),
                        );
                      },
                    ),
                  )),
        ],
      ),
      body: ProductGrid(),
    );
  }
}
