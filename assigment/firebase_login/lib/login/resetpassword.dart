import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  bool isIconeyes=false;
  bool isEmailValid=true;
  final _newPassController = TextEditingController();
  final _emailcontroller=TextEditingController();
  Future<void> _resetPassword() async {
    final prefs = await SharedPreferences.getInstance();
    var storedEmail=prefs.getString('email');
    if(storedEmail==_emailcontroller.text){
      setState(() {
        isEmailValid=true;
      });
      await prefs.setString('pass', _newPassController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password reset successful')),
      );
      Navigator.pop(context);
    }else{
      setState(() {
        isEmailValid=false;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text('Reset Password',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.blue),),
            ),
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.only(right: 120, left: 120),
              child: Container(
                child: TextField(
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                    hintText: 'Enter new Email',
                    prefixIcon: Icon(Icons.account_circle),
                    border: OutlineInputBorder(
                      borderSide: BorderSide()
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: isEmailValid ? Colors.black87 :Colors.red,
                        width: 1
                      )
                    ),

                    errorText: isEmailValid ? null:'Enter same email which used to login'
                  ),
                ),
              ),
            ),SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(right: 120, left: 120),
                child: Container(
                child: TextField(
                  controller: _newPassController,
                  obscureText: !isIconeyes,

                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: 'New Password...',
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
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _resetPassword,
              child: Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
