import 'package:flutter/material.dart';
import 'dart:math' as math;

class HexagonPainter extends CustomPainter {
  static const int SIDES_OF_HEXAGON = 6;
  final double? radius;
  final Offset? center;

  HexagonPainter({this.center, this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color(0xff05c2c9);
    Path path = createHexagonPath();

    canvas.drawPath(path, paint);
  }

  Path createHexagonPath() {
    final path = Path();
    var angle = (math.pi * 2) / SIDES_OF_HEXAGON;
    Offset firstPoint =
        Offset(radius! * math.cos(0.0), radius! * math.sin(0.0));
    path.moveTo(firstPoint.dx + center!.dx, firstPoint.dy + center!.dy);
    for (int i = 1; i <= SIDES_OF_HEXAGON; i++) {
      double x = radius! * math.cos(angle * i) + center!.dx;
      double y = radius! * math.sin(angle * i) + center!.dy;
      path.lineTo(x, y);
    }

    path.close();

    return path;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
