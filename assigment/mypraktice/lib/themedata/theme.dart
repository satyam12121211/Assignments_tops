import 'package:flutter/material.dart';
class theme extends StatefulWidget {
  const theme({super.key});

  @override
  State<theme> createState() => _themeState();
}

class _themeState extends State<theme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text('🐗😓🤑😲☹️😭',style: TextStyle(fontSize: 20),),
      backgroundColor: Theme.of(context).colorScheme.primary,
    ),

    );
  }
}
