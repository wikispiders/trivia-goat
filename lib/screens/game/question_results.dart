import 'package:flutter/material.dart';
import 'package:frases_argentinas/models/user_answer.dart';
import 'package:frases_argentinas/widgets/game/question.dart';
import 'package:frases_argentinas/widgets/game/user_answer_widget.dart';

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
        Question(question: question),
        const SizedBox(height: 20),
        Text(
          correctAnswer,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 22, 206, 22),
          ),
        ),
        const SizedBox(height: 20),
        Column(
          children: usersAnswers
              .map((answer) => UserAnswerWidget(
                    userAnswer: answer,
                    correctAnswer: correctAnswer,
                  ))
              .toList(),
        ),
      ],
    );
  }
}
