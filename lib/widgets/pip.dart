import 'package:flutter/material.dart';

/// Pip, the study companion. Drawn in code so it scales without image assets.
class Pip extends StatelessWidget {
  const Pip({super.key, this.size = 64});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Pip, your study companion',
      child: CustomPaint(size: Size.square(size), painter: _PipPainter()),
    );
  }
}

class _PipPainter extends CustomPainter {
  static const _ink = Color(0xFF16163A);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.scale(size.width / 96);

    final fill = Paint()..style = PaintingStyle.fill;
    final stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Body and belly
    canvas.drawOval(
      Rect.fromCenter(center: const Offset(48, 58), width: 68, height: 60),
      fill..color = const Color(0xFFFBBF24),
    );
    canvas.drawOval(
      Rect.fromCenter(center: const Offset(48, 66), width: 40, height: 32),
      fill..color = const Color(0xFFFDE68A),
    );

    // Eyes
    fill.color = Colors.white;
    canvas.drawCircle(const Offset(37, 52), 6, fill);
    canvas.drawCircle(const Offset(59, 52), 6, fill);
    fill.color = _ink;
    canvas.drawCircle(const Offset(38.5, 53), 3, fill);
    canvas.drawCircle(const Offset(60.5, 53), 3, fill);

    // Smile
    final smile = Path()
      ..moveTo(41, 65)
      ..quadraticBezierTo(48, 72, 55, 65);
    canvas.drawPath(smile, stroke..color = _ink..strokeWidth = 3);

    // Graduation cap
    final board = Path()
      ..moveTo(48, 18)
      ..lineTo(78, 30)
      ..lineTo(48, 42)
      ..lineTo(18, 30)
      ..close();
    canvas.drawPath(board, fill..color = _ink);

    final band = Path()
      ..moveTo(34, 36)
      ..lineTo(34, 45)
      ..quadraticBezierTo(48, 53, 62, 45)
      ..lineTo(62, 36)
      ..close();
    canvas.drawPath(band, fill);

    // Tassel
    canvas.drawLine(const Offset(74, 32), const Offset(74, 46), stroke);
    canvas.drawCircle(
      const Offset(74, 48),
      3.5,
      fill..color = const Color(0xFFF97316),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
