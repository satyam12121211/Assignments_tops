import 'package:flutter/material.dart';
class task_3 extends StatefulWidget {
  const task_3({super.key});

  @override
  State<task_3> createState() => _task_3State();
}

class _task_3State extends State<task_3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hello World',style: TextStyle(color: Colors.black,),),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hello World',style: TextStyle(backgroundColor: Colors.red,color: Colors.white,fontWeight: FontWeight.bold),),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hello World',style: TextStyle(
                  backgroundColor: Colors.green,color: Colors.white,
                  fontWeight: FontWeight.bold,fontSize: 20,
                ),),
            ],
          ),
        ],
      ),
    );
  }
}
