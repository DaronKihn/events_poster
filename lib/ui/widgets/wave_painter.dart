import 'package:events_poster/ui/constants.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    _paintPath1(canvas, size);
    _paintPath2(canvas, size);
    _paintPath3(canvas, size);
  }

  void _paintPath1(Canvas canvas, Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 20);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 20 - 20);
    var firstControlPoint = Offset(size.width * 0.25, size.height - 30 - 20);
    path.quadraticBezierTo(
        firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 20);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 20 - 15);
    path.quadraticBezierTo(
        secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    final paint = Paint()
      ..shader = ui.Gradient.linear(
        Offset(size.width * 0.5, 0),
        Offset(size.width * 0.5, size.height),
        [kDarkPurpleColor, kMediumPurpleColor],
      );
    canvas.drawPath(path, paint);
  }

  void _paintPath2(Canvas canvas, Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 20);

    var firstEndPoint = Offset(size.width * 0.7, size.height - 40);
    var firstControlPoint = Offset(size.width * 0.25, size.height);
    path.quadraticBezierTo(
        firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 45);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(
        secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawPath(path, Paint()..color = kVeryLightPurpleColor);
  }

  void _paintPath3(Canvas canvas, Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 20);

    var firstEndPoint = Offset(size.width * 0.1, size.height - 15 - 20);
    var firstControlPoint = Offset(size.width * 0.05, size.height - 30);
    path.quadraticBezierTo(
        firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 10);
    var secondControlPoint = Offset(size.width * 0.84, size.height);
    path.quadraticBezierTo(
        secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, Paint()..color = kLightPurpleColor);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
