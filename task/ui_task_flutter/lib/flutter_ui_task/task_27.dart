import 'package:flutter/material.dart';

class CustomListTileWidget extends StatelessWidget {
  final List<String> items = const ['Apples', 'Bananas', 'Oranges', 'Grapes'];

  const CustomListTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.shopping_cart),
          title: Text(items[index]),
          trailing: const Icon(Icons.delete, color: Colors.red),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Clicked on ${items[index]}')),
            );
          },
        );
      },
    );
  }
}

class CustomListTileScreen extends StatelessWidget {
  const CustomListTileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: CustomListTileWidget()));
  }
}
