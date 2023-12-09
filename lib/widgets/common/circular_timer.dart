import 'package:flutter/material.dart';
import 'dart:math';

class CircularTimer extends StatefulWidget {
  final int totalTimeInSeconds;

  const CircularTimer({
    Key? key,
    required this.totalTimeInSeconds,
  }) : super(key: key);

  @override
  CircularTimerState createState() => CircularTimerState();
}

class CircularTimerState extends State<CircularTimer>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.totalTimeInSeconds),
    );

    _animation = Tween(begin: 1.0, end: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward().whenComplete(() {});

    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TimerPainter(
        fillValue: _animation.value,
        color: const Color.fromARGB(255, 255, 59, 196),
        strokeWidth: 8.0,
      ),
      child: const SizedBox(
        width: 50,
        height: 50,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class TimerPainter extends CustomPainter {
  final double fillValue;
  final Color color;
  final double strokeWidth;

  TimerPainter({
    required this.fillValue,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final double radius = size.width / 2;

    canvas.drawArc(
      Rect.fromCircle(center: Offset(radius, radius), radius: radius),
      -pi / 2,
      -2 * pi * fillValue,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
