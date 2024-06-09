 import 'dart:math' as pi;
import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final redCircle = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke;
    final arcRect = Rect.fromCircle(
        center: size.bottomCenter(Offset.zero), radius: size.shortestSide);
    canvas.drawArc(arcRect, 0, - pi.ln2, false, redCircle);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => false;
}