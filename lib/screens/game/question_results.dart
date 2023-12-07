import 'package:flutter/material.dart';
import 'package:frases_argentinas/models/user_answer.dart';
import 'package:frases_argentinas/widgets/common/timer_bar.dart';
import 'package:frases_argentinas/widgets/game/question.dart';

class QuestionResults extends StatelessWidget {
  final String question;
  final String correctAnswer;
  final List<UserAnswer> usersAnswers;
  final int time;

  const QuestionResults({
    Key? key,
    required this.question,
    required this.correctAnswer,
    required this.usersAnswers,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TimerBar(time: time),
        Question(question: question),
        const SizedBox(height: 10),
        const Text(
          'Respuesta correcta:',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        Text(
          correctAnswer,
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        const SizedBox(height: 20),
        Table(
          border: TableBorder.all(color: Colors.black),
          children: [
            TableRow(
              decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 185, 11, 69).withOpacity(0.3)),
              children: usersAnswers.map((answer) {
                Color cellColor = answer.answer == correctAnswer
                    ? Colors.green
                    : const Color.fromARGB(255, 255, 17, 0);
                return Center(
                  child: Text(
                    answer.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: cellColor,
                    ),
                  ),
                );
              }).toList(),
            ),
            TableRow(
              decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 233, 14, 87).withOpacity(0.1)),
              children: usersAnswers.map((answer) {
                Color cellColor = answer.answer == correctAnswer
                    ? Colors.green
                    : const Color.fromARGB(255, 255, 17, 0);
                return Center(
                  child: Text(
                    answer.answer,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: cellColor,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 24, 139, 95),
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(8),
          child: const Text(
            'PUNTAJES',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 2),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: usersAnswers
              .map((answer) => Text(
                    '${answer.name}: ${answer.points}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 235, 42, 161),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
