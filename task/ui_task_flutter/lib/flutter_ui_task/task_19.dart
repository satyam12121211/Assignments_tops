import 'package:flutter/material.dart';

class SearchWithSuggestions extends StatefulWidget {
  const SearchWithSuggestions({super.key});

  @override
  State<SearchWithSuggestions> createState() => _SearchWithSuggestionsState();
}

class _SearchWithSuggestionsState extends State<SearchWithSuggestions> {
  final List<String> _data = [
    'Apple',
    'Banana',
    'Grapes',
    'Orange',
    'Mango',
    'Pineapple'
  ];
  List<String> _filtered = [];
  final TextEditingController _controller = TextEditingController();

  void _filter(String query) {
    setState(() {
      _filtered = _data
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(labelText: 'Search'),
            onChanged: _filter,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _filtered.length,
            itemBuilder: (_, index) => ListTile(title: Text(_filtered[index])),
          ),
        ),
      ],
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: SearchWithSuggestions()));
  }
}