import 'package:flutter/material.dart';

import 'drawer.dart';

class bottem extends StatefulWidget {
  const bottem({super.key});
  @override
  State<bottem> createState() => _bottemState();
}

class _bottemState extends State<bottem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Mydrawer(),

      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {},
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Mail'),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_camera_back_outlined),
            label: 'video',
          ),
        ],
      ),
    );
  }
}
