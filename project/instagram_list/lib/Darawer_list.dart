import 'package:flutter/material.dart';
class DarawerList extends StatefulWidget {
  const DarawerList({super.key});


  @override
  State<DarawerList> createState() => _DarawerListState();
}

class _DarawerListState extends State<DarawerList> {
  List<Map<String,String>> usear=[
    {'text': 'All inbox', 'icon':'collections_bookmark_outlined'},
    {'text':'Primary','icon':'laptop_chromebook_rounded'},
    {'text':'Promotions','icon':'task'},
    {'text':'Social','icon':'perm_identity'}
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          MyDrawerown(context),
          MyDraweryour(context)
        ],
      ),
    ),
    );
  }
}
Widget MyDrawerown(BuildContext context) =>Column(
  children: [
    SizedBox(
        height:150 ,
        width:100 ,
        child:
        CircleAvatar(backgroundImage: AssetImage('sat1.jpg'),)

    ),
    Text('Gmail',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
  ],
);
Widget MyDraweryour(BuildContext context) =>Container(
  child:
  Column(
    children: [
      ListView.separated(itemBuilder: (context, index) {
        return Text('All inbox',style: TextStyle(fontSize: 10),),
      }, separatorBuilder: (context, index) {
        
      }, itemCount: usear.length)
    ],
  ),
);