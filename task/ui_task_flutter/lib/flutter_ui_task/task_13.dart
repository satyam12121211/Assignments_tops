import 'package:flutter/material.dart';

class ChangeableNetworkImage extends StatefulWidget {
  const ChangeableNetworkImage({super.key});

  @override
  State<ChangeableNetworkImage> createState() => _ChangeableNetworkImageState();
}

class _ChangeableNetworkImageState extends State<ChangeableNetworkImage> {
  final List<String> _images = [
    'https://picsum.photos/id/237/400/300',
    'https://picsum.photos/id/1003/400/300',
    'https://picsum.photos/id/1025/400/300',
  ];
  int _index = 0;

  void _changeImage() {
    setState(() {
      _index = (_index + 1) % _images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(_images[_index]),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: _changeImage,
          child: const Text("Change Image"),
        ),
      ],
    );
  }
}

class ChangeableImageScreen extends StatelessWidget {
  const ChangeableImageScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: ChangeableNetworkImage()));
  }
}