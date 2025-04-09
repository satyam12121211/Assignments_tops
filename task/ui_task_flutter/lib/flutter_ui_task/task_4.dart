import 'package:flutter/material.dart';
class task_4 extends StatefulWidget {
  const task_4({super.key});

  @override
  State<task_4> createState() => _task_4State();
}

class _task_4State extends State<task_4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 200,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Email...',
                    prefixIcon: Icon(Icons.account_box_outlined),
                    suffixIcon: Icon(Icons.abc),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height:20 ,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 200,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Password...',
                    suffixIcon: Icon(Icons.abc),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
                  ),
                )
              ),
            ],
          ),
          SizedBox(height:20 ,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(height: 40,
                width: 120,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: ElevatedButton(onPressed: (){

                }, style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent,shape:
                RoundedRectangleBorder(borderRadius:
                BorderRadius.circular(5))),
                    child:Text('Log In',style:
                    TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),) ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
