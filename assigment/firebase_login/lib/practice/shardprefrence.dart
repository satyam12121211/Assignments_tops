import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class shardprefrence extends StatefulWidget {
  const shardprefrence({super.key});

  @override
  State<shardprefrence> createState() => _shardprefrenceState();
}

class _shardprefrenceState extends State<shardprefrence> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         FutureBuilder(future: SharedPreferences.getInstance(),
             builder:(context, snapshot) {
               return Center(
                 child: Column(mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Text(snapshot.data!.getString('string').toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red),),
                   ],
                 ),
               );
             }, )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async{
        SharedPreferences sp= await SharedPreferences.getInstance();
        sp.setInt('num',20);
        sp.setDouble('numb', 20.2);
        sp.setString('string','abe bevade');
        sp.setBool('is login', false);
        setState(() {

        });


      },child: Icon(Icons.add),),
    );
  }
}
