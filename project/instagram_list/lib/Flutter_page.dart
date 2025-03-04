import 'package:flutter/material.dart';
class beach extends StatefulWidget {
  const beach({super.key});

  @override
  State<beach> createState() => _beachState();
}

class _beachState extends State<beach> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title:Text('HI, PROGRAMER',style: TextStyle(color: Colors.white,fontSize:20),) ,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [SizedBox(height: 20,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(height: 60,width: 60,
                      child: CircleAvatar(
                        child:Icon(Icons.widgets_outlined),
                        backgroundColor: Colors.green,
                      ),
                    ),
                    Text("Category",style: TextStyle(fontSize:20),)
                  ],
                ),

                Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      child: CircleAvatar(
                        child:Icon(Icons.class_rounded),
                        backgroundColor: Colors.blue,
                      ),
                    ),
                    Text('Office',style: TextStyle(fontSize: 20),)
                  ],
                ),

                Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      child: CircleAvatar(
                        child:Icon(Icons.free_cancellation_outlined),
                        backgroundColor: Colors.red,
                      ),
                    ),
                    Text('File',style: TextStyle(fontSize: 20),)
                  ],
                ),
              ],
            ),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      child: CircleAvatar(
                        child:Icon(Icons.widgets_outlined),
                        backgroundColor: Colors.orangeAccent,
                      ),
                    ),
                    Text('Windo',style: TextStyle(fontSize: 20),)
                  ],
                ),

                Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      child: CircleAvatar(
                        child:Icon(Icons.class_rounded),
                        backgroundColor: Colors.pink,
                      ),
                    ),
                    Text('Fule',style: TextStyle(fontSize: 20),)
                  ],
                ),

                Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      child: CircleAvatar(
                        child:Icon(Icons.free_cancellation_outlined),
                        backgroundColor: Colors.deepPurple,
                      ),
                    ),
                    Text('Note',style: TextStyle(fontSize: 20),)
                  ],
                ),
              ],
            ),ListTile(
              leading:  Text('COURSES',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              trailing:  Text('See All',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      height:200 ,
                      width: 150,
                      child:
                      Image.asset('assets/dap1 (4).png'),
                      color: Colors.white,
                    ),
                    Text('Flutter',style: TextStyle(fontSize: 20),)
                  ],
                ),
                SizedBox(width: 20,),
                Column(
                  children: [
                    Container(
                      height:200 ,
                      width: 150,

                      child:
                      Image.asset('assets/dap2.png'),
                      color: Colors.white,

                    ),
                    Text('Python',style: TextStyle(fontSize: 20),)
                  ],
                )
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      height:200 ,
                      width: 150,
                      child:
                      Image.asset("assets/dap1 (3).png"),
                      color: Colors.grey,

                    ),
                    Text('C++',style: TextStyle(fontSize: 20),)
                  ],
                ),
                SizedBox(width: 20,),
                Column(
                  children: [
                    Container(
                      height:200 ,
                      width: 150,
                      child:
                      Image.asset("assets/dap1.png"),
                      color: Colors.grey,
                    ),
                    Text('React Native',style: TextStyle(fontSize: 20),)
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
