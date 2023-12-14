import 'package:frases_argentinas/app_services/app_services.dart';
import 'package:frases_argentinas/event_handler/server_event_handler.dart';
import 'package:frases_argentinas/screens/game/questions.dart';

class QuestionReceivedHandler extends ServerEventHandler {
  final String question;
  final int time;
  final List<String> options;
  final int numberOfQuestion;
  final int totalQuestions;

  QuestionReceivedHandler(this.question, this.options, this.time, this.numberOfQuestion, this.totalQuestions);

  @override
  bool execute() {
    AppServices().gameStateProvider.setNewQuestion(question, options);
    AppServices().appStateProvider.setScreen(Questions(time: time));
    return true;
  }
}
