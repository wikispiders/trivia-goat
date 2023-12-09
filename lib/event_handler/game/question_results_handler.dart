import 'package:frases_argentinas/app_services/app_services.dart';
import 'package:frases_argentinas/event_handler/server_event_handler.dart';
import 'package:frases_argentinas/models/user_answer.dart';
import 'package:frases_argentinas/screens/game/question_results.dart';

class QuestionResultsHandler extends ServerEventHandler {
  final String question;
  final String correctAnswer;
  final List<UserAnswer> usersAnswers;
  final int time;
  final List<String> options;

  QuestionResultsHandler(this.question, this.correctAnswer, this.usersAnswers, this.time, this.options);

  @override
  bool execute() {
    AppServices().appStateProvider.setScreen(
      QuestionResults(
        question: question, 
        correctAnswer: correctAnswer,
        usersAnswers: usersAnswers,
        time: time,
        options: options,
      )
    );
    return true;
  }
}
