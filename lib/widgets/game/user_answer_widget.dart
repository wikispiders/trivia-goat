import 'package:flutter/material.dart';
import 'package:frases_argentinas/models/user_answer.dart';

class UserAnswerWidget extends StatelessWidget {
  final UserAnswer userAnswer;
  final String correctAnswer;

  const UserAnswerWidget({
    Key? key,
    required this.userAnswer,
    required this.correctAnswer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isCorrect = userAnswer.answer == correctAnswer;
    final containerColor = isCorrect ? Colors.green : Colors.red;
    final textColor = isCorrect ? Colors.green : Colors.red;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: containerColor,
          width: 3,
        ),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            userAnswer.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${userAnswer.answer} - ${userAnswer.points}',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}