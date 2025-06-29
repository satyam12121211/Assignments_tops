import 'dart:async';
import 'package:aapdevloper/login/homepage.dart';
import 'package:aapdevloper/login/logindart.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScr extends StatefulWidget {
  const SplashScr({super.key});

  @override
  State<SplashScr> createState() => _SplashScrState();
}

class _SplashScrState extends State<SplashScr> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 2)); // splash delay
    bool? isLoggedIn = await check();

    if (isLoggedIn == true) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => homepage()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => logindart()),
      );
    }
  }

  Future<bool?> check() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Lottie.asset('assets/TeaL.json')),
          Center(child: Text('Tea Haven',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)),
          SizedBox(height: 5,),
          Center(child: Text('Your Help Always Redy',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 14),))
        ],
      ),
    );
  }
}
