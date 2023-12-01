import 'package:flutter/material.dart';
import 'package:frases_argentinas/widgets/common/countdown_clock.dart';

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
            'El juego está por comenzar',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          CountdownClock(timeToStart: timeToStart,),
        ],
      ),
    );
  }
}
