import 'package:flutter/material.dart';

class NameListView extends StatelessWidget {
  const NameListView({super.key});

  final List<String> names = const [
    "Alice", "Bob", "Charlie", "David", "Emma", "Frank", "Grace", "Hannah"
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: names.length,
      itemBuilder: (_, index) {
        return ListTile(
          title: Text(names[index]),
          onTap: () => print("${names[index]} tapped"),
        );
      },
    );
  }
}