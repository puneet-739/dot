import 'dart:math';
import 'package:flutter/material.dart';

class DotPainter extends CustomPainter with PaintMixin {
  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < 19; i++) {
      init();
      Random random = Random();
      double dx1 = random.nextDouble() * 1000.0;
      double dy1 = random.nextDouble() * 1000.0;
      double dx2 = random.nextDouble() * 1000.0;
      double dy2 = random.nextDouble() * 1000.0;
      canvas.drawCircle(Offset(dx1, dy1), 19.0, painter);
      canvas.drawCircle(Offset(dx2, dy2), 19.0, colorPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class ForGroundPainter extends CustomPainter with PaintMixin {
  Offset offset;
  ForGroundPainter(this.offset);

  @override
  void paint(Canvas canvas, Size size) {
    init();
    canvas.drawCircle(offset, 70.0, painter);
    canvas.drawCircle(offset, 50.0, colorPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

mixin PaintMixin {
  late int randomColorValue;
  late int randomColorHexValue;
  late Color color;
  late Paint painter;
  late Paint colorPaint;
  init() {
    color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    painter = Paint();
    colorPaint = Paint()..color = color;
  }
}
