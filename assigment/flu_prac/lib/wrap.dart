import 'package:flu_prac/file_pick.dart';
import 'package:flutter/material.dart';

class wrapwidet extends StatefulWidget {
  const wrapwidet({super.key});

  @override
  State<wrapwidet> createState() => _wrapwidetState();
}

class _wrapwidetState extends State<wrapwidet> {

  List<String> a = ["satyam", "abcd","hai","yash","Harsh"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
        Wrap(
          spacing: 5,
          runSpacing: 20,
          alignment: WrapAlignment.start,
          children: a.map((item) {
            return Padding(
              padding: const EdgeInsets.only(left: 20),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => filePicker(

                  ),));
                },
                child: Container(
                  height: 100,
                  width: 150,
                  color: Colors.blueAccent,
                  child: Center(child: Text(item)),
                ),
              ),
            );
          }).toList(),
        )


      ),

    );
  }
}


