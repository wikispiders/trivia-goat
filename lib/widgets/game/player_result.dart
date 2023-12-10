import 'package:flutter/material.dart';
import 'package:frases_argentinas/global/common/constants.dart';

class PlayerResultWidget extends StatelessWidget {
  final PlayerData playerData;

  const PlayerResultWidget({
    Key? key,
    required this.playerData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: const BoxDecoration(
        color: CustomColors.playerListPink,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(50),
          right: Radius.circular(50),
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            width: 55,
            height: 45,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              playerData.playerNumber, // A CAMBIAR POR EL PLAYER
              style: const TextStyle(
                color: Colors.pink,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              playerData.playerName, // A CAMBIAR POR EL PLAYER
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Text(
            '${playerData.score}', // A CAMBIAR POR EL PLAYER
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

//Borrar y reemplazar por cosas del player
class PlayerData {
  final String playerNumber;
  final String playerName;
  final int score;

  PlayerData(this.playerNumber, this.playerName, this.score);
}
