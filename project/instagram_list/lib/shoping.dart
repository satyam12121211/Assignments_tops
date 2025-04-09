import 'dart:async';

import 'package:flutter/material.dart';
import 'package:instagram_list/shoping1.dart';

class shoping_slash extends StatefulWidget {
  const shoping_slash({super.key});

  @override
  State<shoping_slash> createState() => _shoping_slashState();
}

class _shoping_slashState extends State<shoping_slash> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),

      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => shopigsg()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/t-3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
