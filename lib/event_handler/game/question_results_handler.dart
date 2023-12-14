import 'package:flutter/material.dart';
import 'package:trivia_goat/app_services/app_services.dart';
import 'package:trivia_goat/event_handler/server_event_handler.dart';
import 'package:trivia_goat/models/user_answer.dart';
import 'package:trivia_goat/screens/game/partial_results.dart';
import 'package:trivia_goat/screens/game/question_results.dart';

import '../../screens/game/end_of_game.dart';

class QuestionResultsHandler extends ServerEventHandler {
  final String question;
  final String correctAnswer;
  late List<UserAnswer> usersAnswers;
  final int time;
  final List<String> options;
  final int screen;
  final int numberOfQuestion;
  final int totalQuestions;


  QuestionResultsHandler(this.question, this.correctAnswer, List<UserAnswer> answers, this.time, 
                         this.options, this.screen, this.numberOfQuestion, this.totalQuestions) {
    answers.sort((a, b) => (b.points - b.partialPoints).compareTo(a.points - a.partialPoints));
    usersAnswers = answers;
  }


  @override
  bool execute() {
    late Widget resultsScreen;
    switch (screen) {
      case 0:
        resultsScreen = QuestionResults(
          question: question, 
          correctAnswer: correctAnswer,
          usersAnswers: usersAnswers,
          time: time,
          options: options,
        );
      case 1:
        resultsScreen = PartialResultsScreen(
          question: question, 
          correctAnswer: correctAnswer,
          usersAnswers: usersAnswers,
          time: time,
          numberOfQuestion: numberOfQuestion,
          totalQuestions: totalQuestions,
        );
      case 2:
        resultsScreen = EndOfGame(
          usersAnswers: usersAnswers,
        );
      default:
        throw Error();
    }
    AppServices().appStateProvider.setScreen(resultsScreen);
    return true;
  }
}
