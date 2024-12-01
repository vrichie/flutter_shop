import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize = 0;
  void onTap() {
    if (selectedSize != 0) {
      Provider.of<CartProvider>(context, listen: false).addCartItem(
        {
          'id': widget.product['id'],
          'company': widget.product['company'],
          'title': widget.product['title'],
          'price': widget.product['price'],
          'size': selectedSize,
          'images': widget.product['images'],
          'quantity': 1,
        },
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product added to cart'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a size'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.product['title'] as String,
                style:
                    const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Image.asset(widget.product['images'] as String),
              const Spacer(
                flex: 2,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200],
                ),
                child: Column(
                  children: [
                    Text('\$${widget.product['price'].toString()}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              (widget.product['sizes'] as List<int>).length,
                          itemBuilder: (context, index) {
                            final size =
                                (widget.product['sizes'] as List<int>)[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedSize = size;
                                  });
                                },
                                child: Chip(
                                  label: Text(
                                    size.toString(),
                                    style: TextStyle(
                                        color: selectedSize == size
                                            ? Colors.white
                                            : Theme.of(context)
                                                .colorScheme
                                                .primary),
                                  ),
                                  backgroundColor: selectedSize == size
                                      ? Theme.of(context).colorScheme.primary
                                      : Colors.grey[200],
                                  // labelStyle: const TextStyle(fontSize: 16),
                                  // backgroundColor: selectedFilter == filters[index]
                                  //     ? Theme.of(context).colorScheme.primary
                                  //     : Colors.grey[200],
                                  // shape: RoundedRectangleBorder(
                                  //   borderRadius: BorderRadius.circular(20),
                                  //   side: const BorderSide(
                                  //       color:
                                  //           Color.fromARGB(255, 238, 238, 238)),
                                  // ),
                                ),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: onTap,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
