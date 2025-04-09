import 'package:flutter/material.dart';
import 'package:instagram_list/shopingss.dart';

class shopingr extends StatefulWidget {
  const shopingr({super.key});

  @override
  State<shopingr> createState() => _shopingrState();
}

class _shopingrState extends State<shopingr> {
  bool ChekBox1 = false;
  bool ChekBox2 = false;
  bool ChekBox3 = false;
  int _value = 1;
  final countries = ['INDIA', 'UK', 'US', 'CANADA', 'AUS', 'CHINA', 'RUSSIA'];
  String? value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 80),
              Row(
                children: [
                  SizedBox(width: 20),
                  Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.blueAccent,
                    ),
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => shopingss()),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      child: Text(
                        'LOG IN',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    height: 50,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.blueAccent,
                    ),
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => shopingss()),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      child: Text(
                        'Registation',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
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
                      decoration: InputDecoration(
                        hintText: "Address...",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        suffixIcon: Icon(Icons.account_box_outlined),
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
                      hint: Text(
                        'Select County',
                        style: TextStyle(fontSize: 20),
                      ),
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
                title: Text('Allow Notification And Otp'),
              ),
              SizedBox(height: 40),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.black87,
                ),
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      if (ChekBox1 == true) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => shopingss()),
                        );
                      }
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 20),
                  SizedBox(width: 80, child: Divider(color: Colors.grey)),
                  SizedBox(width: 30),
                  Text(
                    'Or register with',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(width: 30),
                  SizedBox(width: 80, child: Divider(color: Colors.grey)),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 150),
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/g1.jpeg'),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> dropdownItem(String county) => DropdownMenuItem(
    value: county,
    child: Text(county, style: TextStyle(fontSize: 20)),
  );
}
