import 'package:flutter/material.dart';
import 'package:frases_argentinas/provider/lobby_provider.dart';
import 'package:provider/provider.dart';
import 'package:frases_argentinas/global/common/constants.dart';

class PlayersList extends StatelessWidget {
  const PlayersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LobbyProvider stringList = Provider.of<LobbyProvider>(context);
    final List<String> playersList = stringList.players;
    return Expanded(
      child: ListView.builder(
        itemCount: playersList.length,
        itemBuilder: (context, index) {
          return _buildPlayerListItem(index + 1, playersList[index]);
        },
      ),
    );
  }

  Widget _buildPlayerListItem(int playerNumber, String playerName) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
      child: Container(
        decoration: const BoxDecoration(
          color: CustomColors.playerListPink,
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(50.0),
            right: Radius.circular(50.0),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                playerName[0],
                style: const TextStyle(
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Roboto'),
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Text(
                playerName,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
