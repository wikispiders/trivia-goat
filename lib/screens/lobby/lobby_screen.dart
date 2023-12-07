import 'package:flutter/material.dart';
import 'package:frases_argentinas/app_services/app_services.dart';
import 'package:frases_argentinas/client_messages/start_game.dart';
import 'package:frases_argentinas/widgets/lobby/players_list.dart';
import 'package:frases_argentinas/widgets/lobby/type_widget.dart';
import 'package:frases_argentinas/widgets/lobby/amount_widget.dart';
import 'package:frases_argentinas/widgets/lobby/category_widget.dart';

class LobbyScreen extends StatelessWidget {
  final bool isCreator;
  final int gameId;
  const LobbyScreen({Key? key, required this.isCreator, required this.gameId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: Colors.blue,
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
        const SizedBox(height: 20),
        if (isCreator)
          Column(
            children: [
              Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.pink),
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(50.0),
                    right: Radius.circular(50.0),
                  ),
                  color: const Color.fromARGB(255, 255, 244, 248),
                ),
                padding: const EdgeInsets.only(top: 10),
                child: const AmountWidget(),
              ),
              const SizedBox(height: 10),
              CategoryWidget(),
              const SizedBox(height: 10),
              TypeWidget(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  AppServices().middlewareService.sendMessage(StartGame());
                },
                child: const Text('Presiona para comenzar'),
              ),
            ],
          ),
        if (!isCreator) const Text('Esperando al creador'),
      ],
    );
  }
}
//LO QUE QUIERO: Mitad de la pantalla superior de un color, mitad inferior de otro. El nombre de un usuario en la mitad superior y el del otro en la inferior.
//ID de partida en una franja a través de toda la pantalla, parte superior{}