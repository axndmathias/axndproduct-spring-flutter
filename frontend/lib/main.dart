import 'package:flutter/material.dart';
import 'package:frontend/providers/product_provider.dart';
import 'package:frontend/views/screens/products_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProductsScreen(),
      ),
    );
  }
}
