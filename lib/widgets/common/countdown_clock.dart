import 'dart:async';
import 'package:flutter/material.dart';

class CountdownClock extends StatefulWidget {
  final int timeToStart;
  const CountdownClock({super.key, required this.timeToStart});

  @override
  _CountdownClockState createState() => _CountdownClockState();
}

class _CountdownClockState extends State<CountdownClock> {
  late int countdown;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    countdown = widget.timeToStart;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown > 0) {
        setState(() {
          countdown -= 1;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$countdown',
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}
