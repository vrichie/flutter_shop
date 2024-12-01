import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];

  void addCartItem(Map<String, dynamic> cartItem) {
    cart.add(cartItem);
    notifyListeners();
  }

  void removeCartItem(Map<String, dynamic> cartItem) {
    cart.remove(cartItem);
    notifyListeners();
  }
}
