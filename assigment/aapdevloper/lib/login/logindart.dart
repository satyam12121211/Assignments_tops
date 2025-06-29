import 'package:aapdevloper/login/homepage.dart';
import 'package:aapdevloper/login/registration.dart';
import 'package:aapdevloper/login/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class logindart extends StatefulWidget {
  const logindart({super.key});

  @override
  State<logindart> createState() => _logindartState();
}

class _logindartState extends State<logindart> {
  bool isIconeyes=false;
  final namecontroller=TextEditingController();
  final passcontroller=TextEditingController();
  void initState() {
    super.initState();
    // Clear previous input values on page load
    namecontroller.clear();
    passcontroller.clear();
  }
  void login()async{
    final perf =await SharedPreferences.getInstance();
    final storedname= perf.getString('name');
    final storedpass=perf.getString('pass');
    if(namecontroller.text==storedname && passcontroller.text==storedpass){
      await perf.setBool('isLoggedIn', true);
      Navigator.push(context,MaterialPageRoute(builder: (context) => homepage(),));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('All filelds are required')));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/Tea.jpg'),fit: BoxFit.cover)
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 32.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Log In',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.blue),),
                SizedBox(height: 50,),
                ElevatedButton(style:
                ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(5))),
                    onPressed:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => registration(),));
                    },
                    child:Text('Registration',style:
                    TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.white),)),
                SizedBox(height: 20,),
                TextField(
                  controller: namecontroller,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.account_box_outlined),
                    hintText: 'Name...',
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                  ),
                ),SizedBox(height: 20,),
                TextField(
                  controller: passcontroller,
                  obscureText: !isIconeyes,

                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: 'Password...',
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
                Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => resetpassword(),));
                    },
                        child: Text('Reset',style: TextStyle(color: Colors.blue,fontSize: 15),)),
                    SizedBox(width: 10,)
                  ],
                ),
                SizedBox(height: 20,),
                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent
                    ,shape:
                RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(5))),
                    onPressed:login ,
                    child:Text('Login',style:
                    TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.white),)),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
