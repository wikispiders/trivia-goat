import 'dart:convert';

import 'package:frases_argentinas/client_messages/client_message.dart';

class StartGame extends ClientMessage {
  StartGame();

  @override
  String encode() {
    final creatorData = {
      'event': 'start_game',
    };
    return jsonEncode(creatorData);
  }
}
