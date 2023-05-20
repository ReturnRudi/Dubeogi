import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  final List<Offset> startPointsRed;
  final List<Offset> endPointsRed;
  final List<Offset> startPointsGreen;
  final List<Offset> endPointsGreen;
  final List<Offset> startPointsBlue;
  final List<Offset> endPointsBlue;

  LinePainter({
    required this.startPointsRed,
    required this.endPointsRed,
    required this.startPointsGreen,
    required this.endPointsGreen,
    required this.startPointsBlue,
    required this.endPointsBlue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final scaleX = size.width;
    final scaleY = size.height;

    final redPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < startPointsRed.length; i++) {
      canvas.drawLine(
        startPointsRed[i].scale(scaleX, scaleY),
        endPointsRed[i].scale(scaleX, scaleY),
        redPaint,
      );
    }

    final greenPaint = Paint()
      ..color = Colors.green
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < startPointsGreen.length; i++) {
      canvas.drawLine(
        startPointsGreen[i].scale(scaleX, scaleY),
        endPointsGreen[i].scale(scaleX, scaleY),
        greenPaint,
      );
    }

    final bluePaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < startPointsBlue.length; i++) {
      canvas.drawLine(
        startPointsBlue[i].scale(scaleX, scaleY),
        endPointsBlue[i].scale(scaleX, scaleY),
        bluePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement your condition here.
    return true;
  }
}