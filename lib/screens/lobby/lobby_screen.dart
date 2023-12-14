import 'package:flutter/material.dart';
import 'package:trivia_goat/app_services/app_services.dart';
import 'package:trivia_goat/screens/lobby/home_screen.dart';
import 'package:trivia_goat/client_messages/start_game.dart';
import 'package:trivia_goat/widgets/lobby/players_list.dart';
import 'package:trivia_goat/widgets/lobby/type_widget.dart';
import 'package:trivia_goat/widgets/lobby/amount_widget.dart';
import 'package:trivia_goat/widgets/lobby/category_widget.dart';
import 'package:trivia_goat/widgets/lobby/gameid_widget.dart';
import 'package:trivia_goat/global/common/constants.dart';

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
        GameIDWidget(gameId: gameId),
        const PlayersList(),
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
                  color: CustomColors.widgetWhite,
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
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('START'),
              ),
            ],
          ),
        if (!isCreator)
          TextButton(
            onPressed: () {
              () =>
                  AppServices().appStateProvider.setScreen(const HomeScreen());
            },
            child: const Icon(
              Icons.arrow_back,
              size: 40,
            ),
          ),
      ],
    );
  }
}
