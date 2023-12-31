import 'dart:convert';

import 'package:trivia_goat/client_messages/client_message.dart';

class StartGame extends ClientMessage {
  String category;
  int amount;
  String type;

  StartGame(this.category, this.amount, this.type);

  @override
  String encode() {
    final startGameData = {
      'event': 'start_game',
      'category': category,
      'type': type,
      'amount_questions': amount

    };
    return jsonEncode(startGameData);
  }
}
