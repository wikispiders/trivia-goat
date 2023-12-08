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
  const LobbyScreen({
    Key? key,
    required this.isCreator,
    required this.gameId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: Colors.blue,
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Game ID: $gameId',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        PlayersList(),
        const SizedBox(height: 20),
        if (isCreator)
          Column(
            children: [
              const SizedBox(height: 10),
              const Text(
                'How many questions?',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: 180,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.pink),
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(50.0),
                    right: Radius.circular(50.0),
                  ),
                  color: const Color.fromARGB(255, 255, 244, 248),
                ),
                alignment: Alignment.center,
                child: AmountWidget(
                  key: AmountWidget.amountKey,
                ),
              ),
              const SizedBox(height: 10),
              const CategoryWidget(),
              const SizedBox(height: 10),
              const TypeWidget(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final numberOfQuestions =
                      AmountWidget.amountKey.currentState?.numberOfQuestions;
                  if (numberOfQuestions != null) {
                    AppServices().middlewareService.sendMessage(
                          StartGame('10', numberOfQuestions, 'multiple'),
                        );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text('Please, choose a number between 1 and 50'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                child: const Text('Press to start'),
              ),
            ],
          ),
        if (!isCreator) const Text('Waiting for the creator'),
      ],
    );
  }
}
