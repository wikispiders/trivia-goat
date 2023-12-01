import 'package:flutter/material.dart';

class AnswerCard extends StatelessWidget {
  final String? myAnswer;
  final String option;

  const AnswerCard({super.key, required this.option, required this.myAnswer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Container(
        height: 70,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(92, 255, 255, 255),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: myAnswer == option? Colors.grey.shade600 :Colors.white24,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                option,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}