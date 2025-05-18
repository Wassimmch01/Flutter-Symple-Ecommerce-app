import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingStars extends StatelessWidget {
  final double rating;

  const RatingStars({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
      itemCount: 5,
      itemSize: 24.0,
      direction: Axis.horizontal,
    );
  }
}
