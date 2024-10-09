import 'dart:math';

import 'package:flutter/material.dart';

class SpinningStar extends StatefulWidget {
  const SpinningStar({
    super.key,
    required this.color,
    required this.radius,
    required this.points,
    required this.duration,
  });

  final Color color;
  final double radius;
  final int points;
  final Duration duration;

  @override
  State<SpinningStar> createState() {
    return _SpinngStarState();
  }
}

class _SpinngStarState extends State<SpinningStar> {
  double turns = 0.0;

  void _forward() {
    setState(() => turns += 1);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      _forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      turns: turns,
      duration: widget.duration,
      curve: Curves.decelerate,
      child: CustomPaint(
        size: Size(widget.radius, widget.radius),
        painter: StarPainter(
          color: widget.color,
          points: widget.points,
          innerRadius: widget.radius * 0.65,
          outerRadius: widget.radius,
        ),
      ),
    );
  }
}

class StarPainter extends CustomPainter {
  final Color color;
  final int points;
  final double innerRadius;
  final double outerRadius;

  StarPainter({
    required this.color,
    this.points = 5,
    this.innerRadius = 40,
    this.outerRadius = 80,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double scaleFactor = min(size.width, size.height) / (outerRadius * 2);
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final path = Path();

    List<Offset> starPoints = [];
    for (int i = 0; i < points * 2; i++) {
      final radius = (i.isEven ? outerRadius : innerRadius) * scaleFactor;
      final angle = i * pi / points;
      final x = center.dx + radius * cos(angle - pi / 2);
      final y = center.dy + radius * sin(angle - pi / 2);
      starPoints.add(Offset(x, y));
    }

    if (starPoints.isNotEmpty) {
      path.moveTo(starPoints[0].dx, starPoints[0].dy);

      for (int i = 0; i < starPoints.length; i++) {
        final currentPoint = starPoints[i];
        final nextPoint = starPoints[(i + 1) % starPoints.length];
        final nextNextPoint = starPoints[(i + 2) % starPoints.length];

        final midPoint1 = Offset(
          currentPoint.dx + (nextPoint.dx - currentPoint.dx) * 0.8,
          currentPoint.dy + (nextPoint.dy - currentPoint.dy) * 0.8,
        );
        final midPoint2 = Offset(
          nextPoint.dx + (nextNextPoint.dx - nextPoint.dx) * 0.2,
          nextPoint.dy + (nextNextPoint.dy - nextPoint.dy) * 0.2,
        );

        path.lineTo(midPoint1.dx, midPoint1.dy);
        path.quadraticBezierTo(
          nextPoint.dx,
          nextPoint.dy,
          midPoint2.dx,
          midPoint2.dy,
        );
      }
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
