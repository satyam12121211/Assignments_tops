import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Instagram")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/6714884.jpg"),
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    height: 80,
                    width: 80,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/6714884.jpg"),
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    height: 80,
                    width: 80,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/6714884.jpg"),
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    height: 80,
                    width: 80,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/6714884.jpg"),
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    height: 80,
                    width: 80,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/6714884.jpg"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/6714884.jpg"),
                  ),
                ),
                SizedBox(width: 8),
                Text("Rocky_bhai007"),
                SizedBox(width: 200),
                Icon(Icons.linear_scale_sharp),
              ],
            ),
            SizedBox(height: 2),
            Image.asset("assets/images/6714884.jpg"),
            SizedBox(height: 20),
            Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/6714884.jpg"),
                  ),
                ),
                SizedBox(width: 8),
                Text("Rocky_bhai007"),
                SizedBox(width: 200),
                Icon(Icons.linear_scale_sharp),
              ],
            ),
            SizedBox(height: 3),
            Image.asset("assets/images/6714884.jpg"),
            SizedBox(height: 20),
            Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/6714884.jpg"),
                  ),
                ),
                SizedBox(width: 8),
                Text("Rocky_bhai007"),
                SizedBox(width: 200),
                Icon(Icons.linear_scale_sharp),
              ],
            ),
            SizedBox(height: 3),
            Image.asset("assets/images/6714884.jpg"),
            SizedBox(height: 20),
            Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/6714884.jpg"),
                  ),
                ),
                SizedBox(width: 8),
                Text("Rocky_bhai007"),
                SizedBox(width: 200),
                Icon(Icons.linear_scale_sharp),
              ],
            ),
            SizedBox(height: 3),
            Image.asset("assets/images/6714884.jpg"),
            SizedBox(height: 20),
            Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/6714884.jpg"),
                  ),
                ),
                SizedBox(width: 8),
                Text("Rocky_bhai007"),
                SizedBox(width: 200),
                Icon(Icons.linear_scale_sharp),
              ],
            ),
            SizedBox(height: 3),
            Image.asset("assets/images/6714884.jpg"),
            SizedBox(height: 20),
            Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/6714884.jpg"),
                  ),
                ),
                SizedBox(width: 8),
                Text("Rocky_bhai007"),
                SizedBox(width: 200),
                Icon(Icons.linear_scale_sharp),
              ],
            ),
            SizedBox(height: 3),
            Image.asset("assets/images/6714884.jpg"),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
