import 'package:flutter/material.dart';

class CardWithFAB extends StatelessWidget {
  const CardWithFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Card Container
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Card Title',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'This is a sample card with some description. You can place any widget here.',
              ),
              SizedBox(height: 60), // space for the button
            ],
          ),
        ),

        // Positioned Floating Action Button
        const Positioned(
          right: 30,
          bottom: 30,
          child: FloatingActionButton(
            onPressed: null,
            child: Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}

// Usage Example
class CardWithFABScreen extends StatelessWidget {
  const CardWithFABScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF0F0F0),
      body: SafeArea(
        child: CardWithFAB(),
      ),
    );
  }
}
