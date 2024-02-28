import 'package:flutter/material.dart';

class DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.grey.shade400
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const double dashWidth = 6.0;
    const double dashSpace = 6.0;

    // Sol kenar
    double startY = 0.0;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
      startY += dashWidth + dashSpace;
    }

    // Sağ kenar
    double endY = 0.0;
    while (endY < size.height) {
      canvas.drawLine(Offset(size.width, endY), Offset(size.width, endY + dashWidth), paint);
      endY += dashWidth + dashSpace;
    }

    // Üst kenar
    double startX = 0.0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }

    // Alt kenar
    double endX = 0.0;
    while (endX < size.width) {
      canvas.drawLine(Offset(endX, size.height), Offset(endX + dashWidth, size.height), paint);
      endX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
