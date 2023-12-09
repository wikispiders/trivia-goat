import 'package:flutter/material.dart';
import 'package:frases_argentinas/app_services/app_services.dart';
import 'package:frases_argentinas/screens/lobby/home_screen.dart';

class JoinHome extends StatefulWidget {
  const JoinHome({Key? key}) : super(key: key);

  @override
  State<JoinHome> createState() => _JoinHomeState();
}

class _JoinHomeState extends State<JoinHome> {
  final TextEditingController _controller = TextEditingController();

  void _joinGame() {
    final gameId = _controller.text.trim();
    if (gameId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid Game ID'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      AppServices().middlewareService.join(gameId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.pink, width: 2),
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.pink),
            onPressed: () {
              AppServices().appStateProvider.setScreen(const HomeScreen());
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Insert Game ID',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 15.0,
                ),
                labelText: 'Join a game',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _joinGame,
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text('JOIN'),
            ),
          ],
        ),
      ),
    );
  }
}
