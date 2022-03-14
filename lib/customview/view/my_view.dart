import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyView extends CustomPainter {
  late Paint _paint;
  late double offset = 0.0;

  late ui.Paragraph paragraph;

  MyView(this.offset) {
    _paint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 0.0
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true;

    var paragraphStyle = ui.ParagraphStyle(
        ellipsis: "song", fontSize: 20, fontWeight: FontWeight.w800);
    var paragraphBuilder = ui.ParagraphBuilder(paragraphStyle)
      ..pushStyle(ui.TextStyle(color: Colors.black))
      ..addText("我是宋志领");
    var constraints = const ui.ParagraphConstraints(width: 100);
    paragraph = paragraphBuilder.build()..layout(constraints);
  }

  @override
  void paint(Canvas canvas, Size size) {
    _drawCircle(canvas, size);
    canvas.drawParagraph(
        paragraph, Offset(size.width / 2 - 50, size.height / 2 - 50));
  }

  ///绘制圆
  void _drawCircle(Canvas canvas, Size size) {
    // canvas.drawCircle(const Offset(0, 0), 40, _paint);
    // canvas.drawLine(const Offset(100, 0), const Offset(100, 200), _paint);
    _paint.color = Colors.blueAccent;
    _paint.strokeWidth = 5;
    var rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: 100);
    canvas.drawArc(rect, 0, pi, true, _paint);

    _paint.style = PaintingStyle.fill;
    _paint.color = Colors.red;
    canvas.drawCircle(
        Offset(size.width / 2 + offset, size.height + 30), 20, _paint);

    _paint.color = Colors.orange;
    canvas.drawCircle(
        Offset(size.width / 2 + 20 + offset, size.height + 70), 20, _paint);

    _paint.color = Colors.purple;
    canvas.drawCircle(
        Offset(size.width / 2 + 60 + offset, size.height + 50), 20, _paint);

    _paint.color = Colors.limeAccent;
    canvas.drawCircle(Offset(-70.0 + offset, size.height + 30), 20, _paint);

    _paint.color = Colors.teal;
    canvas.drawCircle(Offset(-30.0 + offset, size.height + 60), 20, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
