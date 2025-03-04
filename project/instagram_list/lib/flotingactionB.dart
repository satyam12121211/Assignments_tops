import 'package:flutter/material.dart';
class List_mail extends StatefulWidget {
  const List_mail({super.key});

  @override
  State<List_mail> createState() => _List_mailState();
}

class _List_mailState extends State<List_mail> {
  final List<Map<String, String>> users = [
    {'name': 'RF_JAINISH', 'image': 'assets/sat1.jpg'},
    {'name': 'PJ_FONT', 'image': 'assets/sat2.jpg'},
    {'name': 'RF_GAJANI', 'image': 'assets/sat3.jpg'},
    {'name': 'RF_YASH', 'image': 'assets/sat4.jpeg'},
    {'name': 'RF_HARSH', 'image': 'assets/sat6.png'},
    {'name': 'RF_JAINISH', 'image': 'assets/sat1.jpg'},
    {'name': 'RF_JAINISH', 'image': 'assets/sat2.jpg'},
    {'name': 'RF_JAINISH', 'image': 'assets/sat3.jpg'},
    {'name': 'RF_JAINISH', 'image': 'assets/sat4.jpeg'},
    {'name': 'RF_JAINISH', 'image': 'assets/sat5.jpeg'},
  ];
  var top = 0;
  var flop=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('insta list',style: TextStyle(fontSize: 20),),
        backgroundColor: Colors.green,
      ),
      body:ListView.separated(itemBuilder:(context, index) {
        return ListTile(
          leading: Container(
              color: index == top ? Colors.green : null,
              child:
              CircleAvatar(backgroundImage: AssetImage(users[index]['image']!),
              )),
          title: Text(users[index]['name']!,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
          subtitle: Text(users[index]['name']!,style: TextStyle(fontSize: 10,),),

        );
      }, separatorBuilder: (context, index) {
        return Divider(
          height: 2,
          thickness: 3,
        );
      }, itemCount: users.length),
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          top++;
          if (top >=users.length){
            top=0;
          }

        });
      },child:Icon(Icons.ad_units_outlined) ,
      ),
    );
  }
}
// floatingActionButton: FloatingActionButton(onpressed: (){
// setState(() {
//
// });
// }),

