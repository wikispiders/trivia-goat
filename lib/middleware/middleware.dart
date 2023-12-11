import 'dart:convert';
import 'dart:io';

import 'package:frases_argentinas/app_services/app_services.dart';
import 'package:frases_argentinas/client_messages/client_message.dart';
import 'package:frases_argentinas/event_handler/server_event_handler.dart';

class Middleware {
  static const baseUri = "ws://192.168.0.160:4040";
  late WebSocket _channel;

  Middleware();

  Future<void> create() async {
    String name = AppServices().usernameProvider.username;
    _channel = await WebSocket.connect("$baseUri/create/$name");
    _startListening();
  }

  Future<void> join(String roomId) async {
    String name = AppServices().usernameProvider.username;
    print('por hacer join');
    _channel = await WebSocket.connect("$baseUri/join/$roomId/$name");
    _startListening();
  }

  void _startListening() {
    _channel.listen(
      (data) async {
        Map<String, dynamic> receivedData = jsonDecode(data);
        print('Received: $receivedData}');
        ServerEventHandler handler = ServerEventHandler.fromEncodedData(data);
        print('hay un handler');
        handler.execute();
      },
      onDone: () {
        print('Connection closed');
      },
      onError: (error) {
        print('Error: $error');
      },
    );
  }

  void sendMessage(ClientMessage message) {
    _channel.add(message.encode());
  }

  void closeConnection() {
    _channel.close();
  }
}
