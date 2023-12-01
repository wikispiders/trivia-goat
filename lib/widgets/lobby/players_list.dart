import 'package:flutter/material.dart';
import 'package:frases_argentinas/provider/lobby_provider.dart';
import 'package:provider/provider.dart';

class PlayersList extends StatelessWidget {
  const PlayersList({super.key});

  @override
  Widget build(BuildContext context) {
    final LobbyProvider stringList = Provider.of<LobbyProvider>(context);
    final List<String> playersList = stringList.players;
    return Expanded(
      child: ListView.builder(
        itemCount: playersList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(playersList[index]),
          );
        },
      ),
    );
  }
}
