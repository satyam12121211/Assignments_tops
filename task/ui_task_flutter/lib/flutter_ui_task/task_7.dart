import 'package:flutter/material.dart';

class ImageGrid extends StatelessWidget {
  const ImageGrid({super.key});

  final List<String> imageUrls = const [
    'https://picsum.photos/id/1/200',
    'https://picsum.photos/id/2/200',
    'https://picsum.photos/id/3/200',
    'https://picsum.photos/id/4/200',
    'https://picsum.photos/id/5/200',
    'https://picsum.photos/id/6/200',
    'https://picsum.photos/id/7/200',
    'https://picsum.photos/id/8/200',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: imageUrls.length,
      itemBuilder: (_, index) {
        return Image.network(imageUrls[index], fit: BoxFit.cover);
      },
    );
  }
}