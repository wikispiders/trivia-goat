import 'package:flutter/material.dart';
import 'package:frases_argentinas/app_services/app_services.dart';
import 'package:frases_argentinas/global/common/constants.dart';
import 'package:frases_argentinas/screens/lobby/home_screen.dart';

class JoinHome extends StatefulWidget {
  const JoinHome({Key? key}) : super(key: key);

  @override
  State<JoinHome> createState() => _JoinHomeState();
}

class _JoinHomeState extends State<JoinHome> with TickerProviderStateMixin {
  late AnimationController _fadeController;

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    // Inicia la animación al cargar la pantalla
    _fadeController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeController.drive(Tween(begin: 0.0, end: 1.0)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.pink, width: 2),
              color: CustomColors.widgetWhite,
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.pink),
              onPressed: () {
                AppServices().appStateProvider.setScreen(const HomeScreen());
              },
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 30),
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
                onPressed: () => AppServices().middlewareService.join(_controller.text),
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('JOIN'),
              ),
              const SizedBox(height: 30),
              Image.asset(
                'assets/join_game.png',
                width: 300,
                height: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }
}
