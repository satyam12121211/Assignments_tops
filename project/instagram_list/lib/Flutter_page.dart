import 'package:flutter/material.dart';

class beach extends StatefulWidget {
  const beach({super.key});

  @override
  State<beach> createState() => _beachState();
}

class _beachState extends State<beach> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HI, PROGRAMER',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Icon(Icons.widgets_outlined),
                      ),
                    ),
                    Text("Category", style: TextStyle(fontSize: 20)),
                  ],
                ),

                Column(
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.class_rounded),
                      ),
                    ),
                    Text('Office', style: TextStyle(fontSize: 20)),
                  ],
                ),

                Column(
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        child: Icon(Icons.free_cancellation_outlined),
                      ),
                    ),
                    Text('File', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: CircleAvatar(
                        backgroundColor: Colors.orangeAccent,
                        child: Icon(Icons.widgets_outlined),
                      ),
                    ),
                    Text('Windo', style: TextStyle(fontSize: 20)),
                  ],
                ),

                Column(
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: CircleAvatar(
                        backgroundColor: Colors.pink,
                        child: Icon(Icons.class_rounded),
                      ),
                    ),
                    Text('Fule', style: TextStyle(fontSize: 20)),
                  ],
                ),

                Column(
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: CircleAvatar(
                        backgroundColor: Colors.deepPurple,
                        child: Icon(Icons.free_cancellation_outlined),
                      ),
                    ),
                    Text('Note', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ],
            ),
            ListTile(
              leading: Text(
                'COURSES',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              trailing: Text(
                'See All',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      height: 200,
                      width: 150,
                      color: Colors.white,
                      child: Image.asset('assets/dap1 (4).png'),
                    ),
                    Text('Flutter', style: TextStyle(fontSize: 20)),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    Container(
                      height: 200,
                      width: 150,
                      color: Colors.white,

                      child: Image.asset('assets/dap2.png'),
                    ),
                    Text('Python', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      height: 200,
                      width: 150,
                      color: Colors.grey,
                      child: Image.asset("assets/dap1 (3).png"),
                    ),
                    Text('C++', style: TextStyle(fontSize: 20)),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    Container(
                      height: 200,
                      width: 150,
                      color: Colors.grey,
                      child: Image.asset("assets/dap1.png"),
                    ),
                    Text('React Native', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
