import 'package:flutter/material.dart';
class ThankYouPage extends StatefulWidget {
  const ThankYouPage({super.key});

  @override
  _ThankYouPageState createState() => _ThankYouPageState();
}

class _ThankYouPageState extends State<ThankYouPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat(reverse: true);

    _offsetAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thank You!'),
      ),
      body: AnimatedBuilder(
        animation: _offsetAnimation,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green[100]!, Colors.brown[100]!],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.5 - _offsetAnimation.value * 0.5, 0.5 + _offsetAnimation.value * 0.5],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.check_circle, color: Colors.green, size: 80),
                  const SizedBox(height: 16),
                  const Text(
                    'Thank You for Your Order!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.brown),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Your order has been placed successfully.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Back to Home'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}