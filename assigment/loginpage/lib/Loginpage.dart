import 'package:flutter/material.dart';

class sherpage extends StatefulWidget {
  const sherpage({super.key});

  @override
  State<sherpage> createState() => _sherpageState();
}

class _sherpageState extends State<sherpage> {
  bool ChekBox1 = false;
  bool ChekBox2 = false;
  bool ChekBox3 = false;
  int _value = 1;
  final countries = ['INDIA', 'UK', 'US', 'CANADA', 'AUS', 'CHINA', 'RUSSIA'];
  String? value;
  final _formkey = GlobalKey<FormState>();
  var _name = TextEditingController();
  var _email = TextEditingController();
  var _phone = TextEditingController();
  var _add = TextEditingController();
  var _Password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('page shere', style: TextStyle(fontSize: 20)),
      ),
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            SizedBox(height: 40),
            Row(
              children: [
                SizedBox(width: 50),
                Container(
                  height: 40,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: _name,
                    decoration: InputDecoration(
                      hintText: "Name...",
                      prefixIcon: Icon(Icons.account_circle_sharp),
                      suffixIcon: Icon(Icons.abc),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 50),
                Container(
                  height: 40,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: _email,
                    decoration: InputDecoration(
                      hintText: "Email@gmail.com...",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      suffixIcon: Icon(Icons.account_circle_sharp),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 50),
                Container(
                  height: 40,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: _phone,
                    decoration: InputDecoration(
                      hintText: "Phone number..",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      suffixIcon: Icon(Icons.call),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 50),
                Container(
                  height: 40,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: _add,
                    decoration: InputDecoration(
                      hintText: "Address...",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      suffixIcon: Icon(Icons.add),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 50),
                Container(
                  height: 40,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: _Password,
                    obscureText: true,
                    obscuringCharacter: '→',
                    decoration: InputDecoration(
                      hintText: "Password...",
                      suffixIcon: Icon(Icons.remove_red_eye_outlined),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 20),
                Container(
                  height: 60,
                  width: 150,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: DropdownButton(
                    hint: Text('Select County', style: TextStyle(fontSize: 20)),
                    icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                    iconSize: 40,
                    value: value,
                    isExpanded: true,
                    items: countries.map(dropdownItem).toList(),
                    onChanged: (value) {
                      setState(() {
                        this.value = value;
                      });
                    },
                  ),
                ),
                Radio(
                  value: 1,
                  groupValue: _value,
                  onChanged: (value) {
                    setState(() {
                      _value = value!;

                    });
                  },
                ),
                Text('Male', style: TextStyle(fontSize: 15)),
                Radio(
                  value: 2,

                  groupValue: _value,
                  onChanged: (value) {
                    setState(() {
                      _value = value!;
                    });
                  },
                ),
                Text('Female', style: TextStyle(fontSize: 15)),
              ],
            ),
            CheckboxListTile(
              value: ChekBox1,
              onChanged: (value) {
                setState(() {
                  ChekBox1 = value!;
                });
              },
              activeColor: Colors.red,
              title: Text('Allow Notification And Otp',style: TextStyle(fontSize: 2,color: Colors.black45),),
            ),
            SizedBox(height: 40),
            ElevatedButton(onPressed: SubmitForm, child: Text('submit')),
            // Container(
            //   height: 50,
            //   width: 250,
            //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),color:Colors.black87 ),
            //   child: OutlinedButton(onPressed: (){
            //     setState(() {
            //
            //       if(ChekBox1==true){
            //         Navigator.push(context, MaterialPageRoute(builder: (context) => sherpage2(),));
            //       }
            //     });
            //
            //   }, style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(7),
            //   )),child:Text('Next',style: TextStyle(fontSize: 20,color: Colors.white),) ),
            // ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 20),

                Container(width: 80, child: Divider(color: Colors.grey)),
                SizedBox(width: 30),
                Text('Or register with', style: TextStyle(color: Colors.grey)),
                SizedBox(width: 30),
                Container(width: 80, child: Divider(color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> dropdownItem(String county) => DropdownMenuItem(
    value: county,
    child: Text(county, style: TextStyle(fontSize: 20)),
  );

  void SubmitForm() {
    if (_formkey.currentState!.validate()) {
      final name = _name.text;
      final email = _email.text;
      final add = _add.text;
      final phone = _phone.text;
      final pass = _Password.text;
      String _gender = _value == 1 ? "Male" : "Female";
      Navigator.push(

        context,
        MaterialPageRoute(
          builder:
              (context) => sherpage2(
            name: name,
            email: email,
            phone: phone,
            add: add,
            pass: pass,
            countries: value,
            gender: _gender,
          ),
        ),
      );
    }
  }
}
