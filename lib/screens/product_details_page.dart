import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final Map<String, Object> product;
  const ProductDetailsPage({super.key, required this.product});

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
                product['title'] as String,
                style:
                    const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Image.asset(product['images'] as String),
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
                    Text('\$${product['price'].toString()}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: (product['sizes'] as List<int>).length,
                          itemBuilder: (context, index) {
                            final size = (product['sizes'] as List<int>)[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: GestureDetector(
                                onTap: () {},
                                child: Chip(
                                  label: Text(
                                    size.toString(),
                                    // style: TextStyle(
                                    //     color: selectedFilter == filters[index]
                                    //         ? Colors.white
                                    //         : Theme.of(context).colorScheme.primary),
                                  ),
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
                      onPressed: () {},
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
