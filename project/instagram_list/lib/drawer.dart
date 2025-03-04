import 'package:flutter/material.dart';


class Mydrawer extends StatefulWidget {
  const Mydrawer({super.key});
  @override
  State<Mydrawer> createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                MyNavDrawer(context), 
                MyNavDrawerMenu(context),
              ],
            ),
          )

    );
  }
}

Widget MyNavDrawer(BuildContext context) => Container(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height:150 ,
        width:100 ,
        child:
        CircleAvatar(backgroundImage: AssetImage('sat1.jpg'),)

      ),
      Text('Gmail',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

    ],
  )
);
Widget MyNavDrawerMenu(BuildContext context) => Column(
  children: [
    ListTile(
      title: Text('All inbox',style: TextStyle(fontSize: 10),),
      leading: Icon(Icons.collections_bookmark_outlined),
    ),
    ListTile(
      title: Text('Primery',style: TextStyle(fontSize: 10),),
      leading: Icon(Icons.laptop_chromebook_rounded),
    ),
    ListTile(
      title: Text('Promotion',style: TextStyle(fontSize: 10),),
      leading: Icon(Icons.task),
    ), ListTile(
      title: Text('Social',style: TextStyle(fontSize: 10),),
      leading: Icon(Icons.perm_identity),
    ),
    ListTile(
      title: Text('Updates',style: TextStyle(fontSize: 10),),
      leading: Icon(Icons.flag_circle_outlined),
    ),
    Text('All labels',style: TextStyle(fontSize: 20),),
    ListTile(
      title: Text('Sttared',style: TextStyle(fontSize: 10),),
      leading: Icon(Icons.star_border_outlined),
    ),
    ListTile(
      title: Text('Snoozed',style: TextStyle(fontSize: 10),),
      leading: Icon(Icons.watch_later_outlined),
    ),
    ListTile(
      title: Text('important',style: TextStyle(fontSize: 10),),
      leading: Icon(Icons.double_arrow),
    ),
    ListTile(
      title: Text('Sent',style: TextStyle(fontSize: 10),),
      leading: Icon(Icons.send),
    ),
    ListTile(
      title: Text('Scheduled',style: TextStyle(fontSize: 10),),
      leading: Icon(Icons.send_and_archive_rounded),
    ), ListTile(
      title: Text('Outbox',style: TextStyle(fontSize: 10),),
      leading: Icon(Icons.outbox_outlined),
    ), ListTile(
      title: Text('Draft',style: TextStyle(fontSize: 10),),
      leading: Icon(Icons.file_open_outlined),
    ), ListTile(
      title: Text('All mail',style: TextStyle(fontSize: 10),),
      leading: Icon(Icons.mark_as_unread_outlined),
    ), ListTile(
      title: Text('Spam',style: TextStyle(fontSize: 10),),
      leading: Icon(Icons.crisis_alert),
    ), ListTile(
      title: Text('Bin',style: TextStyle(fontSize: 10),),
      leading: Icon(Icons.delete_forever_outlined),
    ), ListTile(
      title: Text('Manage subscription',style: TextStyle(fontSize: 10),),
      leading: Icon(Icons.mail_lock_outlined),
    ),
    Text('Google apps',style: TextStyle(fontSize: 20),),
    ListTile(
      title: Text('Clender',style: TextStyle(fontSize: 10),),
      leading: Icon(Icons.calendar_today),
    ), ListTile(
      title: Text('Contect',style: TextStyle(fontSize: 10),),
      leading: Icon(Icons.contact_page_outlined),
    ), ListTile(
      title: Text('Settting',style: TextStyle(fontSize: 10),),
      leading: Icon(Icons.settings_outlined),
    ), ListTile(
      title: Text('Help and feedback',style: TextStyle(fontSize: 10),),
      leading: Icon(Icons.arrow_circle_up_sharp),
    )
  ],
);