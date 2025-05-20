import 'package:flu_prac/file_pick.dart';
import 'package:flu_prac/theme/darkthm.dart';
import 'package:flu_prac/theme/lightthm.dart';
import 'package:flu_prac/wrap.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: light,
      darkTheme: darkt,
      home: wrapwidet(),

    );
  }
}

