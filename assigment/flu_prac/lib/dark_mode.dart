import 'package:flutter/material.dart';

class darkMode extends StatefulWidget {
  const darkMode({super.key});

  @override
  State<darkMode> createState() => _darkModeState();
}

class _darkModeState extends State<darkMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dark Mode"),),
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 100,width: 100,
            ),
            Container(
              height: 100,width: 100,
            ),
            Container(
              height: 100,width: 100,
            ),
            Container(
              height: 100,width: 100,
            )
          ],
        ),
      ),
    );
  }
}
