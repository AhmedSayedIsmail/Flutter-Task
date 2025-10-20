import 'package:flutter/material.dart';

class TagShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final height = size.height;
    final width = size.width;
    final r = 10.0;
    path.lineTo(width - r, 0);
    path.quadraticBezierTo(width, 0, width, r); // top-right curve
    path.lineTo(width, 0);
    path.lineTo(width, height);
    path.lineTo(0, height);
    path.lineTo(height * 0.3, height * 0.5);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
