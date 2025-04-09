import 'package:flutter/material.dart';
class task_1 extends StatefulWidget {
  const task_1({super.key});

  @override
  State<task_1> createState() => _task_1State();
}

class _task_1State extends State<task_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(color: Colors.green,
          child: Text('Hello World',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
        ),
      ),
    );
  }
}
