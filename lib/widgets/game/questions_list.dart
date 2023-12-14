import 'package:flutter/material.dart';
import 'package:trivia_goat/app_services/app_services.dart';
import 'package:trivia_goat/client_messages/player_answer.dart';
import 'package:trivia_goat/provider/game_state_provider.dart';
import 'package:trivia_goat/widgets/game/answer_card.dart';
import 'package:provider/provider.dart';

class QuestionsList extends StatelessWidget {
  const QuestionsList({super.key});

  @override
  Widget build(BuildContext context) {
    GameStateProvider gameStateProvider = Provider.of<GameStateProvider>(context);
    List<String> options = gameStateProvider.options;
    String? selectedAnswer = gameStateProvider.myAnswer;
    String question = gameStateProvider.currentQuestion;
    
    void pickAnswer(int value) {
      if (selectedAnswer != null) return;
      final answer = options[value];
      AppServices().middlewareService.sendMessage(PlayerAnswer(question, answer));
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: gameStateProvider.options.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => pickAnswer(index),
          child: AnswerCard(option: options[index], myAnswer: selectedAnswer),
        );
      }
    );
  }  
}
// Text(options[index])