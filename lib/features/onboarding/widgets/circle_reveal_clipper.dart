import 'package:flutter/material.dart';

class CircleRevealClipper extends CustomClipper<Path> {
  final Offset centerOffset;
  final double radius;

  CircleRevealClipper({required this.centerOffset, required this.radius});

  @override
  Path getClip(Size size) {
    return Path()
      ..addOval(Rect.fromCircle(center: centerOffset, radius: radius))
      ..close();
  }

  @override
  bool shouldReclip(covariant CircleRevealClipper oldClipper) {
    return radius != oldClipper.radius;
  }
}
