import 'package:flutter/material.dart';

class sherpage2 extends StatefulWidget {
  String name;
  String email;
  String add;
  String phone;
  String pass;
  String? countries;
  String? gender;
  sherpage2({
    required this.phone,
    required this.add,
    required this.name,
    required this.email,
    required this.pass,
    required this.countries,
    required this.gender,
  });

  @override
  State<sherpage2> createState() => _sherpage2State();
}

class _sherpage2State extends State<sherpage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('name is :${widget.name}'),
          Text('name is :${widget.phone}'),
          Text('name is :${widget.add}'),
          Text('name is :${widget.email}'),
          Text('name is :${widget.pass}'),
          Text('course is: ${widget.countries}'),
          Text('gender is : ${widget.gender}'),
        ],
      ),
    );
  }
}
