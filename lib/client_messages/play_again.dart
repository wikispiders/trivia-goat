import 'dart:convert';

import 'package:frases_argentinas/client_messages/client_message.dart';

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
