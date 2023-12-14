import 'package:flutter/material.dart';
import 'package:trivia_goat/widgets/common/countdown_clock.dart';

class StartingGameScreen extends StatelessWidget {
  final int timeToStart;
  const StartingGameScreen({super.key, required this.timeToStart});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Game is about to start',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 75),
          CountdownClock(timeToStart: timeToStart),
        ],
      ),
    );
  }
}
