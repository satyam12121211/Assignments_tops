import 'package:flutter/material.dart';
import 'package:instagram_list/Darawer_list.dart';
class DarawerList1 extends StatefulWidget {
  const DarawerList1({super.key});

  @override
  State<DarawerList1> createState() => _DarawerList1State();
}

class _DarawerList1State extends State<DarawerList1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: DarawerList(),
    );
  }
}
