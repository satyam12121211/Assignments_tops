import 'dart:async';
import 'package:flutter/material.dart';
import 'package:instagram_list/shoping2.dart';

class shopingss extends StatefulWidget {
  const shopingss({super.key});

  @override
  State<shopingss> createState() => _shopingssState();
}

class _shopingssState extends State<shopingss> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => shopings()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Container(
            child: Icon(
              Icons.check_circle_outline,
              size: 150,
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
