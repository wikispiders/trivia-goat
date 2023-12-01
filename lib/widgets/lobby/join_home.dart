import 'package:flutter/material.dart';
import 'package:frases_argentinas/app_services/app_services.dart';

class JoinHome extends StatefulWidget {
  const JoinHome({super.key});

  @override
  State<JoinHome> createState() => _JoinHomeState();
}

class _JoinHomeState extends State<JoinHome> {
  TextEditingController _controller = TextEditingController(); 
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controller,
          decoration: InputDecoration(labelText: 'Enter Text'),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            AppServices().middlewareService.join(_controller.text);
          },
          child: Text('Join'),
        ),
      ],
    );
  }
}