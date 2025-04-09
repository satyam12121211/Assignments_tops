import 'package:flutter/material.dart';

class HorizontalProductList extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'T-Shirt',
      'price': 499,
      'image': 'https://via.placeholder.com/100x100.png?text=TShirt'
    },
    {
      'name': 'Shoes',
      'price': 999,
      'image': 'https://via.placeholder.com/100x100.png?text=Shoes'
    },
    {
      'name': 'Watch',
      'price': 1999,
      'image': 'https://via.placeholder.com/100x100.png?text=Watch'
    },
  ];

   HorizontalProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (_, index) {
          final product = products[index];
          return Container(
            width: 140,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 6)
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(product['image'], height: 80),
                const SizedBox(height: 10),
                Text(product['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('₹${product['price']}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SafeArea(child: HorizontalProductList()),
    );
  }
}
