import 'package:flutter/material.dart';
class task_2 extends StatefulWidget {
  const task_2({super.key});

  @override
  State<task_2> createState() => _task_2State();
}

class _task_2State extends State<task_2> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.green,
        title: Text('FlotingActionButton',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      body: Center(
        child: Container(
          child:  Text(
            '$_counter',
            style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      floatingActionButton: Container(
        child: FloatingActionButton(
          onPressed: _incrementCounter,
          child: const Icon(Icons.add),
        ),
      ),
      );
  }
}
