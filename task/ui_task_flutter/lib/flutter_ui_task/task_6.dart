import 'package:flutter/material.dart';
class task_6 extends StatefulWidget {
  const task_6({super.key});

  @override
  State<task_6> createState() => _task_6State();
}

class _task_6State extends State<task_6> {
  var list_images =[
    'sat1.jpg',
    'sat2.jpg',
    'sat3.jpg',
    'sat4.jpeg',
    'sat5.jpeg',
    'sat6.png'
  ];
  var list_name=[
    'jn_jainish',
    'hr_harsh',
    'ys_yash',
    'rj_raj',
    'vs_vishvesh',
    'st_satyam'
  ];
  var list_desk =[
    'jainish use jupiter',
    'harsh use splender',
    'yash use electric vihical #chetak',
    'raj use honda',
    'vishvesh use activa',
    'satyam ride all vihical🚲'


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView.separated(itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
            height: 100,
            width: 60,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/${list_images[index]}'),
            ),
          ),
          title: Text('${list_name[index]}',style:
          TextStyle(fontSize: 20,fontWeight:FontWeight.bold ),),
          subtitle: Text('${list_desk[index]}',style: TextStyle(fontSize: 15),),
          trailing: InkWell(
            child: Icon(Icons.delete),
            onTap: (){
              print('deleted icon');
            },
          ),
        );
      }, separatorBuilder: (context, index) {
        return Divider(
          height: 2,
          thickness: 3,
        );
      }, itemCount: list_images.length)
      ,
    );
  }
}
