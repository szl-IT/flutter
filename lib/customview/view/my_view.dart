import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyView extends CustomPainter {
  late Paint _paint;

  MyView() {
    _paint = Paint()
      ..color = Colors.orange
      ..isAntiAlias = true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(const Offset(20, 20), 20, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
