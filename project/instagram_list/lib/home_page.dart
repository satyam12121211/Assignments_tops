import 'package:flutter/material.dart';
class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}
class _HomepageState extends State<Homepage> {
  // List of users with their profile images and usernames
  final List<Map<String, String>> users = [
    {'name': 'RF_JAINISH', 'image': 'assets/sat1.jpg'},
    {'name': 'PJ_FONT', 'image': 'assets/sat2.jpg'},
    {'name': 'RF_GAJANI', 'image': 'assets/sat3.jpg'},
    {'name': 'RF_YASH', 'image': 'assets/sat4.jpeg'},
    {'name': 'RF_HARSH', 'image': 'assets/sat6.png'},
    {'name': 'RF_JAINISH', 'image': 'assets/sat1.jpg'},
    {'name': 'RF_JAINISH', 'image': 'assets/sat2.jpg'},
    {'name': 'RF_JAINISH', 'image': 'assets/sat3.jpg'},
    {'name': 'RF_JAINISH', 'image': 'assets/sat4.jpeg'},
    {'name': 'RF_JAINISH', 'image': 'assets/sat5.jpeg'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('INSTAGRAM', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Horizontal scroll of profile pictures
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(users.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      height: 80,
                      width: 80,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(users[index]['image']!),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Divider(height: 4),
            SizedBox(height: 30),
            // Dynamic post generation using the users list
            ...List.generate(users.length, (index) {
              return Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Container(
                        height: 30,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(users[index]['image']!),
                        ),
                      ),
                      Text(users[index]['name']!, style: TextStyle(color: Colors.black)),
                      Spacer(),
                      Icon(Icons.linear_scale),
                    ],
                  ),
                  SizedBox(height: 4),
                  Image.asset(users[index]['image']!),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(Icons.favorite_outline_sharp),
                      SizedBox(width: 10),
                      Icon(Icons.mode_comment_outlined),
                      SizedBox(width: 10),
                      Icon(Icons.send),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          print("BUTTON TAP");
                        },
                        child: Text("FOLLOW"),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}