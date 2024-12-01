import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          return ListTile(
            title: Text(
              cartItem['title'].toString(),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            subtitle: Text('Size: ${cartItem['size']}'),
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['images'] as String),
              radius: 35,
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('No',
                              style: TextStyle(color: Colors.blue)),
                        ),
                        TextButton(
                          onPressed: () {
                            Provider.of<CartProvider>(context, listen: false)
                                .removeCartItem(cartItem);
                            Navigator.of(context).pop();
                          },
                          child: const Text('Yes',
                              style: TextStyle(color: Colors.red)),
                        ),
                      ],
                      title: const Text('Remove item from cart'),
                      content: const Text(
                          'Are you sure you want to remove the product from the cart?'),
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          );
        },
      ),
    );
  }
}
