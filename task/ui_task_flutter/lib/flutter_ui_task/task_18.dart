import 'package:flutter/material.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController commentController = TextEditingController();
  String selectedCategory = 'Bug Report';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          const SizedBox(height: 10),
          DropdownButton<String>(
            value: selectedCategory,
            items: const [
              DropdownMenuItem(value: 'Bug Report', child: Text('Bug Report')),
              DropdownMenuItem(value: 'Feature Request', child: Text('Feature Request')),
              DropdownMenuItem(value: 'Other', child: Text('Other')),
            ],
            onChanged: (val) => setState(() => selectedCategory = val!),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: commentController,
            decoration: const InputDecoration(labelText: 'Comments'),
            maxLines: 3,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              final name = nameController.text;
              final comment = commentController.text;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Thanks $name for your feedback!")),
              );
            },
            child: const Text('Submit Feedback'),
          )
        ],
      ),
    );
  }
}

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: FeedbackForm()));
  }
}