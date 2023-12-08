import 'package:flutter/material.dart';
import 'package:frases_argentinas/app_services/app_services.dart';
import 'package:frases_argentinas/client_messages/start_game.dart';
import 'package:frases_argentinas/widgets/lobby/players_list.dart';
import 'package:frases_argentinas/widgets/lobby/type_widget.dart';
import 'package:frases_argentinas/widgets/lobby/amount_widget.dart';
import 'package:frases_argentinas/widgets/lobby/category_widget.dart';
import 'package:frases_argentinas/global/common/constants.dart';

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
        if (isCreator)
          Column(
            children: [
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
              CategoryWidget(
                key: CategoryWidget.categoryKey,
              ),
              const SizedBox(height: 10),
              TypeWidget(
                key: TypeWidget.typeKey,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final numberOfQuestions =
                      AmountWidget.amountKey.currentState?.numberOfQuestions;
                  final chosenCategoryIndex = CategoryWidget
                      .categoryKey.currentState?.selectedCategoryIndex;
                  final chosenTypeIndex =
                      TypeWidget.typeKey.currentState?.selectedTypeIndex;

                  if (numberOfQuestions != null &&
                      chosenCategoryIndex != null &&
                      chosenTypeIndex != null) {
                    final chosenCategory = chosenCategoryIndex + categoryOffset;
                    final chosenCategoryString = chosenCategory.toString();
                    final chosenTypeString =
                        chosenTypeIndex == 0 ? 'multiple' : 'boolean';

                    AppServices().middlewareService.sendMessage(
                          StartGame(chosenCategoryString, numberOfQuestions,
                              chosenTypeString),
                        );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            'Please, check if all parameters are correctly chosen'),
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
