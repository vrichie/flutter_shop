import 'package:flutter/material.dart';
import 'package:flutter_shop/data/global_variable.dart';
import 'package:flutter_shop/screens/home_page.dart';
import 'package:flutter_shop/screens/product_details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan.shade100),
          primaryColor: Colors.cyan.shade100,
          useMaterial3: true,
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              borderSide: BorderSide(color: Colors.grey),
            ),
            prefixIconColor: Colors.grey,
          ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          fontFamily: 'Lato'),
      home: ProductDetailsPage(product: products[0]),
      // home: HomePage(),
    );
  }
}
