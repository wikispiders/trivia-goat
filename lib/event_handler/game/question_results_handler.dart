import 'package:flutter/material.dart';
import 'package:frases_argentinas/app_services/app_services.dart';
import 'package:frases_argentinas/event_handler/server_event_handler.dart';
import 'package:frases_argentinas/models/user_answer.dart';
import 'package:frases_argentinas/screens/game/partial_results.dart';
import 'package:frases_argentinas/screens/game/question_results.dart';

import '../../screens/game/end_of_game.dart';
import '../../screens/game/question_results_list.dart';

class QuestionResultsHandler extends ServerEventHandler {
  final String question;
  final String correctAnswer;
  final List<UserAnswer> usersAnswers;
  final int time;
  final List<String> options;
  final int screen;

  QuestionResultsHandler(this.question, this.correctAnswer, this.usersAnswers, this.time, this.options, this.screen);

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
      print('El screen es 0');
      case 1:
        resultsScreen = QuestionResultsList(
          question: question, 
          correctAnswer: correctAnswer,
          usersAnswers: usersAnswers,
          time: time,
      );
      print('El screen es 1');
      case 2:
        resultsScreen = PartialResultsScreen(
          question: question, 
          correctAnswer: correctAnswer,
          usersAnswers: usersAnswers,
          time: time,
      );
      case 3:
        print('se cambia la screeen');
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
