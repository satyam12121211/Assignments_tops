import 'package:flutter/material.dart';
class addcontainer extends StatefulWidget {
  const addcontainer({super.key});

  @override
  State<addcontainer> createState() => _addcontainerState();
}

class _addcontainerState extends State<addcontainer> {
  List<int> containers = [];
  int counter = 0;

  void addContainer() {
    setState(() {
      containers.add(counter++);
    });
  }

  void removeContainer(int index) {
    setState(() {
      containers.removeAt(index);
    });
  }

  void openDetailPage(int id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(id: id),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add/Remove Containers"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addContainer,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: containers.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => openDetailPage(containers[index]),
            onLongPress: () => removeContainer(index),
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              color: Colors.blueAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Container ${containers[index]}",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Icon(Icons.touch_app, color: Colors.white),
                ],
              ),
            ),
          );
        },
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