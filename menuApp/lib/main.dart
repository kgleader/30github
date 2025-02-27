// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/product_overview_screen.dart';
import './provider/cart_provider.dart'; // Исправлен путь (provider вместо providers)
import './screens/cart_screen.dart'; // Добавлен импорт
import './screens/checkout_screen.dart'; // Добавлен импорт

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Объединили home и routes
      home: ProductOverviewScreen(),
      routes: {
        '/cart': (ctx) => CartScreen(),
        '/checkout': (ctx) => CheckoutScreen(),
      },
    );
  }
}
