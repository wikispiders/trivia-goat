import 'package:flutter/material.dart';
import 'package:frases_argentinas/widgets/lobby/clipboard_widget.dart'; // Importa tu nueva clase

class GameIDWidget extends StatelessWidget {
  final int gameId;

  const GameIDWidget({
    Key? key,
    required this.gameId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.blue,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Game ID: $gameId',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          CopyToClipboardButton(
            textToCopy: gameId.toString(),
            tooltip: 'Copy Game ID',
          ),
        ],
      ),
    );
  }
}