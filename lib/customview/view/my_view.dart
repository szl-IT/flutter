import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyView extends CustomPainter {
  late Paint _paint;

  MyView() {
    _paint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 0.0
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    _drawCircle(canvas, size);
  }

  ///绘制圆
  void _drawCircle(Canvas canvas, Size size) {
    // canvas.drawCircle(const Offset(100, 100), 40, _paint);
    // canvas.drawLine(const Offset(100, 0), const Offset(100, 200), _paint);

    _paint.color = Colors.blueAccent;
    _paint.strokeWidth = 5;
    var rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: 100);
    canvas.drawArc(rect, 0, pi, true, _paint);

    _paint.style = PaintingStyle.fill;
    _paint.color = Colors.red;
    canvas.drawCircle(Offset(size.width / 2, size.height + 30), 20, _paint);

    _paint.color = Colors.orange;
    canvas.drawCircle(
        Offset(size.width / 2 + 20, size.height + 70), 20, _paint);

    _paint.color = Colors.purple;
    canvas.drawCircle(
        Offset(size.width / 2 + 60, size.height + 50), 20, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
