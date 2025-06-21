import 'package:firebase_login/login/logindart.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class registration extends StatefulWidget {
  const registration({super.key});

  @override
  State<registration> createState() => _registrationState();
}

class _registrationState extends State<registration> {
  bool isIconeyes=false;
  final namecontroller=TextEditingController();
  final passcontroller=TextEditingController();
  final emailcontroller=TextEditingController();


  void register()async{
    final perf=await SharedPreferences.getInstance();
     perf.setString('name', namecontroller.text);
     perf.setString('pass', passcontroller.text);
     perf.setString('email', emailcontroller.text);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Registration successful')),
    );

    Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Registration',style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 50,color: Colors.blue),),
            SizedBox(height: 50,),
            Container(height: 40,
              width: 250,
              child: TextField(
                controller: namecontroller,
                decoration: InputDecoration(hintText: 'Name...',
                suffixIcon: Icon(Icons.account_box_outlined),

                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                ),
              ),
            ),SizedBox(height: 20,),
            Container(height: 40,
              width: 250,
              child: TextField(
                controller: emailcontroller,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: 'Enter your Email Addres...',
                    prefixIcon: Icon(Icons.account_circle),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                ),
              ),
            ),SizedBox(height: 20,),
            Container(height: 40,
              width: 250,
              child: TextField(
                controller: passcontroller,
                obscureText: !isIconeyes,

                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Password',
                    suffixIcon: GestureDetector(onTap: (){
                      setState(() {
                        isIconeyes=!isIconeyes;
                      });
                    },
                        child: Icon(isIconeyes ? Icons.remove_red_eye_outlined: Icons.remove_red_eye)),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                ),
              ),
            ),SizedBox(height: 20,),
            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent
                ,shape:
                RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(5))),
                onPressed:()=> register(),
                child:Text('Register',style:
                TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.white),)),
          ],
        ),
      ),
    );
  }
}
