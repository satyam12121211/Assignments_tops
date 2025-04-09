import 'package:flutter/material.dart';

class ShoppingCartDemo extends StatefulWidget {
  const ShoppingCartDemo({super.key});

  @override
  State<ShoppingCartDemo> createState() => _ShoppingCartDemoState();
}

class _ShoppingCartDemoState extends State<ShoppingCartDemo> {
  int cartItemCount = 0;

  void _addToCart() {
    setState(() {
      cartItemCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping Cart"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text('Cart: $cartItemCount')),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (_, index) => ListTile(
          title: Text('Product ${index + 1}'),
          trailing: ElevatedButton(
            onPressed: _addToCart,
            child: const Text("Add to Cart"),
          ),
        ),
      ),
    );
  }
}