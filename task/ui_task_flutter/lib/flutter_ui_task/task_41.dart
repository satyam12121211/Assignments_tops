import 'package:flutter/material.dart';

class RatingWidget extends StatefulWidget {
  final int initialRating;
  final Function(int) onRatingChanged;

  const RatingWidget({
    Key? key,
    this.initialRating = 0,
    required this.onRatingChanged,
  }) : super(key: key);

  @override
  State<RatingWidget> createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  late int _currentRating;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.initialRating;
  }

  void _updateRating(int newRating) {
    setState(() {
      _currentRating = newRating;
    });
    widget.onRatingChanged(newRating);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        final starIndex = index + 1;
        return IconButton(
          icon: Icon(
            starIndex <= _currentRating ? Icons.star : Icons.star_border,
            color: Colors.amber,
            size: 30,
          ),
          onPressed: () => _updateRating(starIndex),
        );
      }),
    );
  }
}

// Example usage widget
class RatingExample extends StatelessWidget {
  const RatingExample({super.key});

  @override
  Widget build(BuildContext context) {
    return RatingWidget(
      initialRating: 3,
      onRatingChanged: (rating) {
        print("User selected rating: $rating");
      },
    );
  }
}
