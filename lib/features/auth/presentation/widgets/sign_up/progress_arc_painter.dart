import 'dart:math' as math;
import 'package:flutter/material.dart';

class ArcProgressPainter extends CustomPainter {
  final double progress; // 0.0 to 1.0
  final Color progressColor;
  final Color backgroundColor;
  final double strokeWidth;
  final double startAngle; // in radians
  final double sweepAngle; // total arc span in radians

  ArcProgressPainter({
    required this.progress,
    required this.progressColor,
    required this.backgroundColor,
    this.strokeWidth = 22,
    this.startAngle =
        -math.pi - (math.pi / 10), // ~135° — matches your screenshot
    this.sweepAngle = math.pi * 2, // 270° total arc
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (math.min(size.width, size.height) - strokeWidth) / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final progressPaint = Paint()
      ..color = progressColor
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // background track (optional — remove if you only want the filled arc)
    canvas.drawArc(rect, startAngle, sweepAngle, false, backgroundPaint);

    // progress arc
    canvas.drawArc(
      rect,
      startAngle,
      sweepAngle * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant ArcProgressPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.progressColor != progressColor;
  }
}
