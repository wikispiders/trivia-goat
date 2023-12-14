import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:trivia_goat/app_services/app_services.dart';
import 'package:trivia_goat/client_messages/client_message.dart';
import 'package:trivia_goat/event_handler/server_event_handler.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Middleware {
  static final backendHost = dotenv.get('BACKEND', fallback: 'wss://trivia-backend-p4o1.onrender.com');
  late WebSocketChannel _channel;

  Middleware();

  Future<void> create() async {
    String name = AppServices().usernameProvider.username;
    try {
      print('Conectandose a $backendHost');

      _channel = WebSocketChannel.connect(Uri.parse("$backendHost/create/$name"));
      _startListening();
    } catch (error) {
      print('Error en la conexión a $backendHost: $error');
    }
    
  }

  Future<void> join(String roomId) async {
    String name = AppServices().usernameProvider.username;
    try {
      print('Conectandose Join a $backendHost');
      _channel = WebSocketChannel.connect(Uri.parse("$backendHost/join/$roomId/$name"));
      _startListening();
    } catch (error) {
      print('Error en la conexión a $backendHost: $error');
    }
  }

  void _startListening() {
    _channel.stream.listen(
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
    _channel.sink.add(message.encode());
  }

  void closeConnection() {
    _channel.sink.close();
  }
}
