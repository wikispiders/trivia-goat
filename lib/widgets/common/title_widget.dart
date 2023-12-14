import 'package:flutter/material.dart';
import 'package:trivia_goat/screens/lobby/lobby_screen.dart';
import 'package:trivia_goat/screens/game/end_of_game.dart';
import 'package:trivia_goat/screens/lobby/home_screen.dart';
import 'package:trivia_goat/app_services/app_services.dart';
import 'package:trivia_goat/global/common/constants.dart';

class TitleWidget extends StatelessWidget implements PreferredSizeWidget {
  final Widget currentScreen;

  const TitleWidget(this.currentScreen, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool showLeadingIcon =
        (currentScreen is LobbyScreen || currentScreen is EndOfGame);

    return AppBar(
      title: const Text(
        'TRIVIA GOAT',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      backgroundColor: Theme.of(context).primaryColor,
      leading: showLeadingIcon
          ? IconButton(
              icon: const Icon(Icons.home, color: CustomColors.homeWhite),
              iconSize: 30,
              onPressed: () {
                AppServices().appStateProvider.setScreen(const HomeScreen());
              },
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
