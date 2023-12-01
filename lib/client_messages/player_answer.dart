import 'dart:convert';

import 'package:frases_argentinas/client_messages/client_message.dart';

class PlayerAnswer extends ClientMessage {
  final String question;
  final String answer;
  PlayerAnswer(this.question, this.answer);

  @override
  String encode() {
    final creatorData = {
      'event': 'submit_answer',
      'question': question,
      'answer': answer,

    };
    return jsonEncode(creatorData);
  }
}
