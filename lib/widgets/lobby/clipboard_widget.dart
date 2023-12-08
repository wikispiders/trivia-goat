import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyToClipboardButton extends StatelessWidget {
  final String textToCopy;
  final String tooltip;

  const CopyToClipboardButton({
    Key? key,
    required this.textToCopy,
    this.tooltip = 'Copy game ID',
  }) : super(key: key);

  void _copyToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: textToCopy)).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Copied to Clipboard'),
          duration: Duration(seconds: 2),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.copy),
      onPressed: () {
        _copyToClipboard(context);
      },
      tooltip: tooltip,
      color: Colors.blueGrey,
      iconSize: 20,
    );
  }
}
