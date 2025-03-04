import 'package:flutter/material.dart';
class page_home extends StatefulWidget {
  const page_home({super.key});

  @override
  State<page_home> createState() => _page_homeState();
}

class _page_homeState extends State<page_home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body:
      Column(
        children: [
          SizedBox(height: 50,),
          Text('HOW TO BURN OFF',style: TextStyle(fontSize: 35),),
          SizedBox(height: 50,),
          Container(

            child:

            Center(child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  height:480 ,
                  width: 300,

                  child:
                  Column(
                    children: [
                      SizedBox(height: 40,),
                      Container(
                          height: 70,
                          width: 70,
                          child:
                          Image.asset('assets/burger.jpg')),
                      SizedBox(height: 20,),
                      Text("BURGER",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                      Text('test the burger dominoze',style: TextStyle(fontSize: 15),),
                      SizedBox(height: 50,),
                      OutlinedButton(onPressed: (){
                        print("hello burger");
                      }, child:Text("PURCHASE") ),
                      SizedBox(height: 40,),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(height: 80,width: 200,
                          color: Colors.white,
                          child:
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(child: Icon(Icons.account_balance)),
                                  Text("van")
                                ],
                              ),
                              SizedBox(width: 30,),
                              Column(
                                children: [
                                  Container(child: Icon(Icons.account_tree_outlined)),
                                  Text("van")
                                ],
                              ),
                              SizedBox(width: 30,),
                              Column(
                                children: [
                                  Container(child: Icon(Icons.account_box_outlined)),
                                  Text("van")
                                ],
                              ),
                              SizedBox(width: 30,),
                              Column(
                                children: [
                                  Container(child: Icon(Icons.ad_units_outlined)),
                                  Text("van")
                                ],
                              ),

                            ],
                          ),

                        ),
                      )
                    ],
                  ),
                ),

              ],
            )
            ),
          ),
        ],
      ),
    );
  }
}
