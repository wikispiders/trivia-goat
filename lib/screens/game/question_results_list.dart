import 'package:flutter/material.dart';
import 'package:frases_argentinas/models/user_answer.dart';
import 'package:frases_argentinas/widgets/game/question.dart';
import 'package:frases_argentinas/widgets/game/user_answer_widget.dart';

class QuestionResultsList extends StatelessWidget {
  final String question;
  final String correctAnswer;
  final List<UserAnswer> usersAnswers;
  final int time;

  const QuestionResultsList({
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
        const SizedBox(height: 50),
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
