import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/badge.dart';
import '../widgets/badge.dart';
import '../widgets/product_grid.dart';
import './cart_screen.dart';
import 'package:badges/badges.dart' as badges;  

class ProductOverviewScreen extends StatelessWidget {
  const ProductOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          Consumer<CartProvider>(
            builder: (_, cart, ch) => badges.Badge(...),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CartScreen(cart: ,),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: ProductGrid(),
    );
  }
}
