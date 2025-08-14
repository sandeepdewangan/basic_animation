import 'package:flutter/material.dart';

class BouncingBall extends CustomPainter {
  final double animationValue;

  BouncingBall({super.repaint, required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.pinkAccent;

    canvas.drawCircle(
      Offset(size.width / 2.0, size.height - (size.height * animationValue)),
      20,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
