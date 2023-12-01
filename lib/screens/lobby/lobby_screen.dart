import 'package:flutter/material.dart';
import 'package:frases_argentinas/app_services/app_services.dart';
import 'package:frases_argentinas/client_messages/start_game.dart';
import 'package:frases_argentinas/widgets/lobby/players_list.dart';

class LobbyScreen extends StatelessWidget {
  final bool isCreator;
  final int gameId;
  const LobbyScreen({super.key, required this.isCreator, required this.gameId});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('ID Juego: $gameId'),
        PlayersList(),
        SizedBox(height: 20),
        isCreator? ElevatedButton(
          onPressed: () {
            AppServices().middlewareService.sendMessage(StartGame());
          },
          child: Text('Presiona para comenzar'),
        ) : Text('Esperando al creador'),
      ],
    );
  }
}
