import 'package:flutter/material.dart';
import 'package:flutter_shop/components/product_card.dart';
import 'package:flutter_shop/data/global_variable.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = [
    'All',
    'Adidas',
    'Nike',
    'Puma',
    'New Balance',
    'Reebok'
  ];
  late String selectedFilter;
  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    'Shoes\nCollection',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                    ),
                  )),
                ],
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedFilter = filters[index];
                          });
                        },
                        child: Chip(
                          label: Text(
                            filters[index],
                            style: TextStyle(
                                color: selectedFilter == filters[index]
                                    ? Colors.white
                                    : Theme.of(context).colorScheme.primary),
                          ),
                          labelStyle: const TextStyle(fontSize: 16),
                          backgroundColor: selectedFilter == filters[index]
                              ? Theme.of(context).colorScheme.primary
                              : Colors.grey[200],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                                color: Color.fromARGB(255, 238, 238, 238)),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // shoes list
              Expanded(
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductCard(
                      title: product['title'] as String,
                      price: product['price'] as double,
                      image: product['images'] as String,
                      bgColor: index.isEven
                          ? Theme.of(context).primaryColor
                          : Colors.grey[100]!,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
