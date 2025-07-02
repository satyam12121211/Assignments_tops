import 'package:appdevelopment/Homescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(TravelGuidanceApp());
}

class TravelGuidanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Guidance',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
