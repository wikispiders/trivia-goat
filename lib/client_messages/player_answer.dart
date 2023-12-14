import 'dart:convert';

import 'package:trivia_goat/client_messages/client_message.dart';

class PlayerAnswer extends ClientMessage {
  final String question;
  final String answer;
  PlayerAnswer(this.question, this.answer);

  @override
  String encode() {
    final answerData = {
      'event': 'submit_answer',
      'question': question,
      'answer': answer,

    };
    return jsonEncode(answerData);
  }
}
