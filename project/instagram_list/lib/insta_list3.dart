import 'dart:async';

import 'package:flutter/material.dart';
import 'package:instagram_list/home_page.dart';

class instalist extends StatefulWidget {
  const instalist({super.key});

  @override
  State<instalist> createState() => _instalistState();
}

class _instalistState extends State<instalist> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Homepage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: SizedBox(
            height: 300,
            width: 300,
            child: CircleAvatar(backgroundImage: AssetImage("insta7.webp")),
          ),
        ),
      ),
    );
  }
}
