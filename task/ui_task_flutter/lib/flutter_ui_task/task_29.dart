
import 'package:flutter/material.dart';

class OverlayEffectWidget extends StatelessWidget {
  const OverlayEffectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background Image
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
              width: 300,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),

          // Semi-transparent overlay
          Container(
            width: 300,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(16),
            ),
          ),

          // Centered Text
          const Text(
            'Beautiful View',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  color: Colors.black,
                  offset: Offset(1, 1),
                  blurRadius: 2,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Usage Example
class OverlayExampleScreen extends StatelessWidget {
  const OverlayExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: OverlayEffectWidget(),
      ),
    );
  }
}
