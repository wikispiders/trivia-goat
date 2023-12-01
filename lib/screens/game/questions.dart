import 'package:flutter/material.dart';
import 'package:frases_argentinas/provider/game_state_provider.dart';
import 'package:frases_argentinas/widgets/common/timer_bar.dart';
import 'package:frases_argentinas/widgets/game/question.dart';
import 'package:provider/provider.dart';
import '../../widgets/game/questions_list.dart';

class Questions extends StatelessWidget {
  final int time;
  const Questions({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    final question = context.select((GameStateProvider p) => p.currentQuestion);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TimerBar(time: time),
        Question(question: question),
        const SizedBox(height: 10),
        const QuestionsList(),
      ],
    );
  }
}
