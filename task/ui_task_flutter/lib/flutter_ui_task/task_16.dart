import 'package:flutter/material.dart';

class AutoImageCarousel extends StatefulWidget {
  const AutoImageCarousel({super.key});

  @override
  State<AutoImageCarousel> createState() => _AutoImageCarouselState();
}

class _AutoImageCarouselState extends State<AutoImageCarousel> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  final List<String> _carouselImages = [
    'https://picsum.photos/id/201/400/300',
    'https://picsum.photos/id/202/400/300',
    'https://picsum.photos/id/203/400/300',
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), _autoSlide);
  }

  void _autoSlide() {
    if (!mounted) return;
    setState(() {
      _currentPage = (_currentPage + 1) % _carouselImages.length;
    });
    _controller.animateToPage(
      _currentPage,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    Future.delayed(const Duration(seconds: 3), _autoSlide);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      itemCount: _carouselImages.length,
      itemBuilder: (_, index) {
        return Image.network(
          _carouselImages[index],
          fit: BoxFit.cover,
        );
      },
    );
  }
}

class CarouselScreen extends StatelessWidget {
  const CarouselScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: AutoImageCarousel()));
  }
}