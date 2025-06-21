import 'package:flutter/material.dart';
class media_query extends StatefulWidget {
  const media_query({super.key});

  @override
  State<media_query> createState() => _media_queryState();
}

class _media_queryState extends State<media_query> {
  @override
  Widget build(BuildContext context) {
    var mediaquery=MediaQuery.of(context);

    return Scaffold(
      body: Builder(builder: (context) {
        if(mediaquery.orientation==Orientation.portrait){
          return portraitwidget(mediaquery.size);
        }else{
          return landscapewidget(mediaquery.size);
        }
      },)
    );
  }

  Widget portraitwidget(Size size) {
    return Center(
      child: Container(
        height: size.height*0.8,
        width: size.width*0.8,
        decoration: BoxDecoration(color: Colors.blue),
        child: Center(child: Text('satyam',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.red),)),
      ),
    );
  }

  Widget landscapewidget(Size size) {
    return Center(
      child: Container(
        height: size.height*0.8,
        width: size.width*0.8,
        decoration: BoxDecoration(color: Colors.yellow),
        child: Center(child: Text('satyam',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.pink),)),
      ),
    );
  }
}
