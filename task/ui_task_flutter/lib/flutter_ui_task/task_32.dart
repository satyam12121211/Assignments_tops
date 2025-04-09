import 'package:flutter/material.dart';

class CustomIconTextButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const CustomIconTextButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          // Text Container
          Container(
            padding: const EdgeInsets.only(top: 30, bottom: 12, left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),

          // Positioned Icon (overlay)
          Positioned(
            top: -15,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: Icon(icon, color: Colors.blueAccent),
            ),
          ),
        ],
      ),
    );
  }
}

// Usage Example
class CustomButtonScreen extends StatelessWidget {
  const CustomButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      body: const Center(
        child: CustomIconTextButton(
          icon: Icons.favorite,
          text: 'Like',
          onPressed: onButtonTap,
        ),
      ),
    );
  }

  static void onButtonTap() {
    print('Custom Button Pressed!');
  }
}
