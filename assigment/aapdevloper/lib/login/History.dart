import 'package:flutter/material.dart';
class HistoryPage extends StatelessWidget {
  final List<Map<String, dynamic>> orderHistory;

  const HistoryPage({super.key, required this.orderHistory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
      ),
      body: orderHistory.isEmpty
          ? const Center(child: Text('No orders yet', style: TextStyle(fontSize: 16, color: Colors.grey)))
          : ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: orderHistory.length,
        itemBuilder: (context, index) {
          var item = orderHistory[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text('${item['name']} (${item['sugar']})'),
              subtitle: Text('Ordered on: ${item['date']}'),
              trailing: Text('₹${item['price']}', style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          );
        },
      ),
    );
  }
}

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reset Password')),
      body: const Center(child: Text('Reset Password Page (Placeholder)')),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  const PlaceholderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Placeholder Page')),
      body: const Center(child: Text('Placeholder Page')),
    );
  }
}