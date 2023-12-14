import 'dart:convert';

import 'package:trivia_goat/client_messages/client_message.dart';

class PlayAgain extends ClientMessage {
  PlayAgain();

  @override
  String encode() {
    final playAgainData = {
      'event': 'play_again',
    };
    return jsonEncode(playAgainData);
  }
}
