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
        Container(
          width: double.infinity,
          color: const Color.fromARGB(
              255, 247, 162, 221), // Cambiar color de la mitad superior
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'ID Juego: $gameId',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28, // Letra más grande
              fontWeight: FontWeight.bold, // Negrita
              color: Colors.white, // Color de la letra
            ),
          ),
        ),
        PlayersList(),
        SizedBox(height: 20),
        isCreator
            ? ElevatedButton(
                onPressed: () {
                  AppServices().middlewareService.sendMessage(StartGame());
                },
                child: Text('Presiona para comenzar'),
              )
            : Text('Esperando al creador'),
      ],
    );
  }
}
//LO QUE QUIERO: Mitad de la pantalla superior de un color, mitad inferior de otro. El nombre de un usuario en la mitad superior y el del otro en la inferior.
//ID de partida en una franja a través de toda la pantalla, parte superior{}