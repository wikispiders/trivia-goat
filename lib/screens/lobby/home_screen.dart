import 'package:flutter/material.dart';
import 'package:frases_argentinas/app_services/app_services.dart';
import 'package:frases_argentinas/provider/username_provider.dart';
import 'package:frases_argentinas/screens/lobby/join_home.dart';
import 'package:provider/provider.dart';

import 'package:frases_argentinas/global/common/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;

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
    UsernameProvider userNameProvider =
        Provider.of<UsernameProvider>(context);

    return FadeTransition(
      opacity: _fadeController.drive(Tween(begin: 0.0, end: 1.0)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/logo_trivia.png',
                width: 300,
                height: 300,
              ),
              const Text(
                'Welcome!',
                style: TextStyle(
                  color: Colors.pink,
                  fontFamily: 'OpenSans',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                alignment: Alignment.centerLeft,
                decoration: kBoxDecorationStyle,
                height: 60.0,
                child: TextField(
                  onChanged: userNameProvider.setUsername,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(top: 1.0),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    hintText: 'Enter your Name',
                    hintStyle: kHintTextStyle,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton.icon(
                onPressed: () {
                  if (userNameProvider.username.isNotEmpty) {
                    AppServices().middlewareService.create();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please, insert a player name'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.games),
                label: const Text(
                  'New Game',
                  style: TextStyle(fontSize: 25),
                ),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(5.0),
                  shadowColor: MaterialStateProperty.all<Color>(
                    CustomColors.buttonShadowPink,
                  ),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {
                  if (userNameProvider.username.isNotEmpty) {
                    AppServices().appStateProvider.setScreen(const JoinHome());
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please, insert a player name'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.start),
                label: const Text(
                  'Join Game',
                  style: TextStyle(fontSize: 25),
                ),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(5.0),
                  shadowColor: MaterialStateProperty.all<Color>(
                    CustomColors.buttonShadowPink,
                  ),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
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
