import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/cart.dart';
import 'screens/menu_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Cart(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MenuScreen(),
    );
  }
}
