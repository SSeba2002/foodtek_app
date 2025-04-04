
import 'package:flutter/material.dart';

class ChatMessage {
  final String text;
  final bool isUser;
  final String time;

  ChatMessage({
    required this.text,
    required this.isUser,
    required this.time,
  });
}

class TailPainter extends CustomPainter {
  final Color color;
  final bool isUser;

  TailPainter({required this.color, required this.isUser});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    if (isUser) {
      path.moveTo(0, size.height);
      path.quadraticBezierTo(size.width * 0.5, size.height * 0.8, size.width, size.height * 0.5);
      path.lineTo(size.width, 0);
    } else {
      path.moveTo(size.width, size.height);
      path.quadraticBezierTo(size.width * 0.5, size.height * 0.8, 0, size.height * 0.5);
      path.lineTo(0, 0);
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}