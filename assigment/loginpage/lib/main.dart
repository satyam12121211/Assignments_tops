import 'package:flutter/material.dart';
import 'package:loginpage/Loginpage.dart';
import 'package:loginpage/photopicker/filepicker.dart';
import 'package:loginpage/themedata/dark.dart';
import 'package:loginpage/themedata/light.dart';
import 'package:loginpage/themedata/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: light,
      darkTheme: dark,
      home: sherpage(),
    );
  }
}
