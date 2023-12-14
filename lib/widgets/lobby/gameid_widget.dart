import 'package:flutter/material.dart';
import 'package:trivia_goat/widgets/lobby/clipboard_widget.dart';
import 'package:trivia_goat/widgets/lobby/wpp_share_widget.dart';

class GameIDWidget extends StatelessWidget {
  final int gameId;

  const GameIDWidget({
    Key? key,
    required this.gameId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(thickness: 2, color: Colors.pink), // Línea superior
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Game ID: $gameId',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                ),
              ),
              CopyToClipboardButton(
                textToCopy: gameId.toString(),
                tooltip: 'Copy Game ID',
              ),
              WhatsAppShareButton(gameId: gameId),
            ],
          ),
        ),
        const Divider(thickness: 2, color: Colors.pink), // Línea inferior
      ],
    );
  }
}
