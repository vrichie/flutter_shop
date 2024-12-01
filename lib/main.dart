import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/cart_provider.dart';
import 'package:flutter_shop/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
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
            textTheme: const TextTheme(
              titleLarge: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            fontFamily: 'Lato'),
        home: const HomePage(),
      ),
    );
  }
}
