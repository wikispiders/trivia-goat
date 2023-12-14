import 'package:flutter/material.dart';
import 'package:trivia_goat/models/user_answer.dart';
import 'package:trivia_goat/screens/game/partial_results.dart';
import 'package:trivia_goat/screens/lobby/splash_screen.dart';

class AppStateProvider extends ChangeNotifier {
  Widget _currentScreen = SplashScreen();
    // Widget _currentScreen = PartialResultsScreen(
    //   question: "Esta es una pregunta", 
    //   correctAnswer: "respuesta correcta",
    //   usersAnswers: [
    //     UserAnswer("Martu", "Malisimo", 2530, 1000),
    //     UserAnswer("Mateo", "respuesta correcta", 3249, 452),
    //     UserAnswer("Juan", "Noppp", 2520, 0),
    //   ],
    //   time: 10,
    // );



  Widget get currentScreen => _currentScreen;

  void setScreen(Widget screen) {
    _currentScreen = screen;
    notifyListeners();
  }
}
