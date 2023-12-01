import 'package:flutter/material.dart';
import 'package:frases_argentinas/models/user_answer.dart';
import 'package:frases_argentinas/widgets/common/timer_bar.dart';
import 'package:frases_argentinas/widgets/game/question.dart';

class QuestionResults extends StatelessWidget {
  final String question;
  final String correctAnswer;
  final List<UserAnswer> usersAnswers;
  final int time;
  
  const QuestionResults({super.key, required this.question, 
                         required this.correctAnswer, 
                         required this.usersAnswers, 
                         required this.time});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TimerBar(time: time),
        Question(question: question),
        const SizedBox(height: 10),
        Text('La resp correcta fue $correctAnswer'),
        Text('Todas las respuestas: ${usersAnswers.map((e) => "${e.name}: ${e.answer} - ${e.points}").toList().reduce((value, element) => value + element)}')
      ],
    );
  }
}
