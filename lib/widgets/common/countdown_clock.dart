//import 'dart:async';
import 'package:flutter/material.dart';

class CountdownClock extends StatefulWidget {
  final int timeToStart;

  const CountdownClock({Key? key, required this.timeToStart}) : super(key: key);

  @override
  _CountdownClockState createState() => _CountdownClockState();
}

class _CountdownClockState extends State<CountdownClock>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int countdown = 0;

  @override
  void initState() {
    super.initState();
    countdown = widget.timeToStart;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _animation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(_controller);

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          countdown -= 1;
          _controller.reset();
          if (countdown > 1) _controller.forward();
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Opacity(
            opacity: _animation.value,
            child: Text(
              '$countdown',
              style: const TextStyle(
                fontSize: 60,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
          );
        },
      ),
    );
  }
}
