import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart' show kIsWeb;


class WhatsAppShareButton extends StatelessWidget {
  final int gameId;

  const WhatsAppShareButton({
    Key? key,
    required this.gameId,
  }) : super(key: key);

  Future<void> _shareGameId(BuildContext context) async {
    final url = Uri.parse('whatsapp://send?text=Game ID: $gameId');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('WhatsApp message could not be sent'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return Container();
    }
    if (Platform.isAndroid || Platform.isIOS) {
      return IconButton(
        icon: const Icon(Icons.share),
        onPressed: () => _shareGameId(context),
        tooltip: 'Share Game ID via WhatsApp',
        color: Colors.lightBlue,
        iconSize: 22,
      );
    }
    return Container();
  }
}
