import 'package:flutter/material.dart';

class HalfCircleBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintFill = Paint()
      ..color = Colors.grey.shade100
      ..style = PaintingStyle.fill;

    final paintBorder = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height * 3);

    canvas.drawArc(rect, 3.14, 3.14, false, paintFill);

    canvas.drawArc(rect, 3.14, 3.14, false, paintBorder);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
