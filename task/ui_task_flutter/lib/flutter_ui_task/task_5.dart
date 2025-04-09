import 'package:flutter/material.dart';
class task_5 extends StatefulWidget {
  const task_5({super.key});

  @override
  State<task_5> createState() => _task_5State();
}

class _task_5State extends State<task_5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  InkWell(onTap: (){
                  
                  },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.green),
                      child: Text('🐗',style: TextStyle(fontSize: 120),),
                    ),
                  ),
                  Text('lulululu',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                ],
              ),
              Column(
                children: [
                  InkWell(onTap: (){

                  },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.red),
                      child: Text('🐗',style: TextStyle(fontSize: 120),),
                    ),
                  ),
                  Text('lulululu',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                ],
              ),
          ]
          ),

          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  InkWell(onTap: (){

                  },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.yellow),
                      child: Text('🐗',style: TextStyle(fontSize: 120),),
                    ),
                  ),
                  Text('lulululu',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                ],
              ),
              Column(
                children: [
                  InkWell(onTap: (){

                  },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.blueAccent),
                      child: Text('🐗',style: TextStyle(fontSize: 120),),
                    ),
                  ), Text('lulululu',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                ],
              ),
            ],),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  InkWell(onTap: (){

                  },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.deepOrangeAccent),
                      child: Text('🐗',style: TextStyle(fontSize: 120),),
                    ),
                  ), Text('lulululu',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                ],
              ),
              Column(
                children: [
                  InkWell(onTap: (){

                  },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey),
                      child: Text('🐗',style: TextStyle(fontSize: 120),),
                    ),
                  ), Text('lulululu',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                ],
              ),
            ],)
        ],
      ),
    );
  }
}
