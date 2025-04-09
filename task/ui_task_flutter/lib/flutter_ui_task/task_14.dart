import 'package:flutter/material.dart';

class PhotoGallery extends StatelessWidget {
  const PhotoGallery({super.key});

  final List<String> urls = const [
    'https://picsum.photos/id/1011/200/200',
    'https://picsum.photos/id/1012/200/200',
    'https://picsum.photos/id/1013/200/200',
    'https://picsum.photos/id/1014/200/200',
    'https://picsum.photos/id/1015/200/200',
    'https://picsum.photos/id/1016/200/200',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: urls.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return Image.network(
          urls[index],
          fit: BoxFit.cover,
          loadingBuilder: (_, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }
}

class PhotoGalleryScreen extends StatelessWidget {
  const PhotoGalleryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: PhotoGallery()));
  }
}