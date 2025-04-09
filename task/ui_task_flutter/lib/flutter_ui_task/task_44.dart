import 'package:flutter/material.dart';

// Avatar Badge Widget
class AvatarBadge extends StatelessWidget {
  final String imageUrl;
  final bool isOnline;

  const AvatarBadge({
    Key? key,
    required this.imageUrl,
    this.isOnline = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(imageUrl),
        ),
        Positioned(
          bottom: 4,
          right: 4,
          child: Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: isOnline ? Colors.green : Colors.grey,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}

// Product Model
class Product {
  final String name;
  final double price;
  final String imageUrl;

  Product({required this.name, required this.price, required this.imageUrl});
}

// Sample Products
final List<Product> products = [
  Product(name: "Laptop", price: 999.99, imageUrl: "https://via.placeholder.com/150"),
  Product(name: "Smartphone", price: 499.99, imageUrl: "https://via.placeholder.com/150"),
  Product(name: "Headphones", price: 79.99, imageUrl: "https://via.placeholder.com/150"),
];

// Custom Button Widget
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

//    Home Page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final String userName = "Maxi";
    final String userImage = "https://i.pravatar.cc/150?img=3";

    return Scaffold(
      appBar: AppBar(title: const Text("Task 44: Full UI")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Profile Section
              AvatarBadge(imageUrl: userImage, isOnline: true),
              const SizedBox(height: 10),
              Text(userName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "Flutter developer passionate about building clean UIs.",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 30),

              // Product Catalog Section
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Product Catalog", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 10),
              Column(
                children: products.map((product) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      children: [
                        Image.network(product.imageUrl, width: 100, height: 100, fit: BoxFit.cover),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(product.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 5),
                              Text("\$${product.price}", style: const TextStyle(color: Colors.green)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),

              // Custom Button
              CustomButton(
                text: "Buy Now",
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Purchase initiated!")),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
