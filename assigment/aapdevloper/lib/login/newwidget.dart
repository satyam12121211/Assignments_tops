import 'package:aapdevloper/login/homepage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class newwidget extends StatefulWidget {
  const newwidget({super.key});

  @override
  State<newwidget> createState() => _newwidgetState();
}


class _newwidgetState extends State<newwidget> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
            height: 50,
            width: double.infinity,
            color: Colors.lightBlueAccent,
            alignment: Alignment.center,
            child: Icon(Icons.sunny,size: 30,color: Colors.orangeAccent,),
          ),
            Container(width: double.infinity,
            height: 150,color: Colors.yellow,
            child: Lottie.asset('assets/camel.json'),),
            Container(height: 2,color: Colors.yellow,),
            Container(height: 20,color: Colors.brown,),
            Container(height: 300,
              width: double.infinity,
              color: Colors.black45,
              child:Lottie.asset('assets/bike.json'),
            ),
            Container(height: 20,color: Colors.brown,),Container(height: 2,color: Colors.yellow,),
            Container(
              height:200,
              width: double.infinity,
              color: Colors.blue,
              child: Lottie.asset('assets/fish.json'),
            )
          ],
        ),
      ),

    );
  }
}