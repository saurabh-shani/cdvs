import 'package:flutter/material.dart';

class RPSCustomPainternew extends CustomPainter {
  final backgroundColors;

  RPSCustomPainternew(this.backgroundColors);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = backgroundColors //Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width, 0);
    path0.lineTo(0, size.height);
    path0.lineTo(0, 0);
    path0.lineTo(size.width, 0);
    path0.lineTo(size.width, 0);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
