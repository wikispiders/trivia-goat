import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsAppShareButton extends StatelessWidget {
  final int gameId;

  const WhatsAppShareButton({
    Key? key,
    required this.gameId,
  }) : super(key: key);

  Future<void> _shareGameId() async {
    final url = Uri.parse('whatsapp://send?text=Game ID: $gameId');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.share),
      onPressed: _shareGameId,
      tooltip: 'Share Game ID via WhatsApp',
      color: Colors.white,
      iconSize: 20,
    );
  }
}
