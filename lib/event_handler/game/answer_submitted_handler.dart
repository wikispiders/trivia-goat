import 'package:frases_argentinas/app_services/app_services.dart';
import 'package:frases_argentinas/event_handler/server_event_handler.dart';

class AnswerSubmittedHandler extends ServerEventHandler {
  final String question;
  final String answer;

  AnswerSubmittedHandler(this.question, this.answer);

  @override
  bool execute() {
    AppServices().gameStateProvider.setAnswer(question, answer);
    return true;
  }
}
