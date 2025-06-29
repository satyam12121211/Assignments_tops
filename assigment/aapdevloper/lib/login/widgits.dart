import 'package:aapdevloper/login/homepage.dart';
import 'package:flutter/material.dart';
class widget extends StatefulWidget {
  const widget({super.key});

  @override
  State<widget> createState() => _widgetState();
}

class _widgetState extends State<widget> with TickerProviderStateMixin{
  double Opacity=1.0;
  double padding=0.0;
  bool isSelected= false;
  bool isSel= false;
  bool isVel=false;
  bool _set=true;
  int increment=0;
  double PaddingA=0.0;
  bool isShadowbox=true;
  bool isPositioned=false;
  double isRotyation=0.0;
  int count=0;
  final List<String> image=[
    'assets/sat3.jpg',
    'assets/1355096.jpeg',
    'assets/sat2.jpg',
    'assets/sat5.jpeg',
    'assets/sat6.png',
    'assets/sat1.jpg'
  ];
  bool isGel=false;

  late AnimationController _controller;
  void initState(){
    _controller=AnimationController(
      duration:const Duration(seconds: 1),
      vsync: this,);
    super.initState();
  }
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AboutListTile(applicationName: 'Flutter',
            applicationVersion: 'version.1.1.0',
            applicationIcon: FlutterLogo(),
            applicationLegalese: 'legless',
            aboutBoxChildren: [
              Text('the flutter widjet')
            ],
            icon: Icon(Icons.info,)),
            ElevatedButton(onPressed: (){
              showDialog(
                  context: context,
                  builder: (context) => const AboutDialog(
                applicationIcon: FlutterLogo(),
                applicationLegalese: 'legless',
                applicationName: 'Flutter Widjet',
                applicationVersion: 'version:1.1.0',
                children: [Text('this is created by flutter mapp')],
              ));
            }, child:Text('showdailog',style: TextStyle(fontSize: 20),) ),
            Stack(
              children: [Container(
                height: 100,
                width: 50,
                child:ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),onPressed: (){

                }, child: Text('bye')) ,
              ),AbsorbPointer(
                child: Container(
                  height: 50,
                  width: 100,
                  child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green),onPressed: (){

                  }, child: Text('hii')),
                ),
              )
              ],
            ),
            ElevatedButton(onPressed: (){
              showDialog(context: context, builder: (context) => AlertDialog(
                actions: [TextButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: Text('close'))],
                title: Text('flutter'),
                contentPadding: EdgeInsets.all(20.0),
                content: Text('alert mapp dailog'),
              ),);
            }, child:Text('kale aavaje') ),
            Container(
              height: 120,
              width: double.infinity,
              color: Colors.grey,
              alignment: Alignment.topRight,
              child: FlutterLogo(
                size: 60,
              ),
            ),
            GestureDetector(onTap: (){
              setState(() {
                isSelected=!isSelected;
              });
            },
              child: Container(
                height: 120,
                width: double.infinity,
                color: Colors.green,
                child: AnimatedAlign(alignment:isSelected ? Alignment.topLeft : Alignment.topRight ,
                    duration: Duration(seconds: 2),
                  curve: Curves.fastOutSlowIn,
                  child: FlutterLogo(
                    size: 40,
                  ),
                ),
              ),
            ),SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                setState(() {
                  isSel=!isSel;
                });
              },
              child: AnimatedContainer(duration: Duration(seconds: 1),
              height: isSel ? 200:300,
              width: isSel ? 400:500,
              curve: Curves.fastOutSlowIn,
              color: isSel ? Colors.blue:Colors.green,
              alignment: isSel ? Alignment.topLeft:Alignment.topRight,
              child: FlutterLogo(
                size: 50,
              ),),
            ),

            AnimatedDefaultTextStyle(child:Text('Flutter'), style: TextStyle(
              fontSize: _set ? 50:100,
              color: _set ? Colors.red:Colors.blueAccent,
              fontWeight: FontWeight.bold
            ), duration: Duration(seconds: 2)),
            TextButton(onPressed: (){
              setState(() {
                _set=!_set;
              });
            }, child:Text('tap') ),

            GestureDetector(
              onTap: (){
                if(isGel==false){
                  _controller.forward();
                  isGel=true;
                }else{
                  _controller.reverse();
                  isGel=false;
                }
              },child: AnimatedIcon(icon:AnimatedIcons.play_pause,
                progress: _controller,
            size: 100,),
            ),
            TextButton(onPressed: (){
              setState(() {
                isVel=!isVel;
              });
            }, child:Text('switch') ),
            AnimatedCrossFade(firstChild: Image.asset('assets/sat1.jpg'),
                secondChild: Image.asset('assets/sat2.jpg'),
                crossFadeState:isVel ? CrossFadeState.showFirst:CrossFadeState.showSecond,
                duration: Duration(seconds: 1)),
            SizedBox(height: 10,),
            AnimatedOpacity(opacity:Opacity, duration: Duration(seconds: 1),
              child: FlutterLogo(size: 80,),),
            ElevatedButton(onPressed: (){
              setState(
                      ()=> Opacity=Opacity==0 ? 1.0:0.0
              );
            }, child:Text('opecity') ),
            ElevatedButton(onPressed: (){
              setState(() {
               PaddingA= PaddingA==0.0 ? 100.0:0.0;
              });
            }, child:Text("Padding=$PaddingA") ),
            AnimatedPadding(padding: EdgeInsets.all(PaddingA), duration:Duration(seconds: 1),
            curve: Curves.easeInOut,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.orangeAccent,
            ),),
            AnimatedPhysicalModel(child:SizedBox(
              height: 100,
              width: 100,
              child: Icon(Icons.android),
              
            ) , color: Colors.white,
                elevation: isShadowbox ? 0:6.0,
                shape: BoxShape.rectangle,
                curve: Curves.fastOutSlowIn
                , shadowColor: Colors.black,
                duration: Duration(seconds: 1)),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: (){
              setState(() {
                isShadowbox=!isShadowbox;
              });
            }, child:Text('ShadowBox') ),
            Container(
              height: 350,
              width: 200,
              child: Stack(children: [
                AnimatedPositioned(child: GestureDetector(
                  onTap: (){
                    setState(() {
                      isPositioned=!isPositioned;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Colors.orangeAccent,borderRadius: BorderRadius.circular(5)),
                  ),
                ), duration:Duration(seconds: 2),
                width: isPositioned ? 200:50,
                height: isPositioned?50:200,
                top: isPositioned ? 50:150,
                )
              ],),
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: AnimatedRotation(turns: isRotyation, duration: Duration(seconds: 1),
                child: FlutterLogo(size: 100,),
              ),
            ),
            ElevatedButton(onPressed: (){
              setState(()=>isRotyation +=10);
            }, child: Text('Turn')),
            AnimatedSwitcher(duration: Duration(milliseconds: 500),
           
            child: Text('$count',style: TextStyle(fontSize: 40),
            key: ValueKey(count),),
            transitionBuilder: (Widget child,Animation<double> animation) {
              return ScaleTransition(scale: animation,child: child,);

            },),
            ElevatedButton(onPressed: (){
              setState(() {
                count +=1;
              });
            }, child: Text('add')),
            ElevatedButton(onPressed: (){
              showModalBottomSheet(context: context, builder: (BuildContext context) {
                return SizedBox(
                  height: 400,
                  width: double.infinity,
                  child: Center(
                    child: ElevatedButton(onPressed: (){
                      Navigator.pop(context);
                    }, child:Text('ii') ),
                  ),
                );
              },);
            }, child:Text('BottomSheet') )
          ],
        ),
      ),
    );
  }
}
