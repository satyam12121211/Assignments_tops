import 'package:flutter/material.dart';

class InfiniteScrollList extends StatefulWidget {
  const InfiniteScrollList({super.key});

  @override
  State<InfiniteScrollList> createState() => _InfiniteScrollListState();
}

class _InfiniteScrollListState extends State<InfiniteScrollList> {
  final ScrollController _scrollController = ScrollController();
  final List<int> _items = List.generate(20, (i) => i);
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMore);
  }

  void _loadMore() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 50 && !_loading) {
      setState(() => _loading = true);
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _items.addAll(List.generate(10, (i) => _items.length + i));
          _loading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _items.length + 1,
      itemBuilder: (context, index) {
        if (index == _items.length) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        return ListTile(title: Text("Item ${_items[index]}"));
      },
    );
  }
}

class InfiniteScrollScreen extends StatelessWidget {
  const InfiniteScrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: InfiniteScrollList()));
  }
}
