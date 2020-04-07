import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  final Color color;
  final List<Offset> offsets;
  final double lineWidth;
  LinePainter({
    @required this.color,
    @required this.offsets,
    @required this.lineWidth
  });
  @override
  void paint(Canvas canvas, Size size) {
    Path path = new Path();
    path.addPolygon(offsets, false);
    Paint paint = Paint()..color=color..strokeWidth=lineWidth..style=PaintingStyle.stroke..strokeCap=StrokeCap.round;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}