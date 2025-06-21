

import 'package:firebase_login/login/aadcontainer.dart';
import 'package:firebase_login/login/logindart.dart';
import 'package:firebase_login/login/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:firebase_login/login/newwidget.dart';
import 'package:firebase_login/login/widgits.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

 class _homepageState extends State<homepage> {
//   Future<void> logout(BuildContext context) async {
//     final perf = await SharedPreferences.getInstance();
//     await perf.setBool('isLoggedIn', false);
//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(builder: (_) => const loginpage()),
//           (route) => false,
//     );
//   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black),
        ),
        backgroundColor: Colors.blue,
      ),
      body: HomeBody(),
      bottomNavigationBar:MyBottomnavigationWidget(),
      drawer: MyDrawer(),
    );
  }
}

// ✅ Home Page Body with InkWell Buttons
class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        

      ],
    );
  }
}
class MyBottomnavigationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(onTap: (value){

    },backgroundColor: Colors.blue,
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.add),label: 'add')
        ]);
  }
}

// 🔧 Same Drawer Code
class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String? Name;

  String? Email;

  String? Pass;
  @override
  void initState(){
    super.initState();
    detail();
  }

 Future<void> detail()async{
   final perf=await SharedPreferences.getInstance();
   setState(() {
     Name=perf.getString('name');
     Email=perf.getString('email');
     Pass=perf.getString('pass');
   });
 }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(height: 200,
            width: double.infinity,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${Name}',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    '${Email}',
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                  Text(
                    '${Pass}',
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
          // UserAccountsDrawerHeader(
          //   accountName: Text("Satyam Kumar"),
          //   accountEmail: Text("satyam@example.com"),
          //   currentAccountPicture: CircleAvatar(
          //     backgroundImage: AssetImage('assets/profile.jpg'),
          //   ),
          //   decoration: BoxDecoration(
          //     color: Colors.indigo,
          //   ),
          // ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap:() async{
              var prefs = await SharedPreferences.getInstance();
              prefs.setBool('isLoggedIn', false);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => logindart(),));

            },
          ),
          ListTile(
            leading: Icon(Icons.lock_reset),
            title: Text("Reset Password"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResetPasswordPage()),
              );
            },
          ),
          ExpansionTile(title: Text('Pages'),
            leading:Icon(Icons.add_business),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  buildDrawerItem('PageCreative', (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => widget(),));
                  }),
                  buildDrawerItem('PageLottie',(){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => newwidget(),));
                  })
                ],),
              )
            ],
          )
        ],
      ),
    );
  }
}
class DetailPage extends StatelessWidget {
  final int id;

  const DetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail of Container $id"),
      ),
      body: Center(
        child: Text(
          "You tapped on Container $id",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
Widget buildDrawerItem( String title,VoidCallback onTap){
  return ListTile(
    title: Text(title),
    onTap: onTap,
  );
}

