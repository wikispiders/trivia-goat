import 'package:flutter/material.dart';
import 'package:trivia_goat/screens/lobby/splash_screen.dart';

class AppStateProvider extends ChangeNotifier {
  Widget _currentScreen = const SplashScreen();

  Widget get currentScreen => _currentScreen;

  void setScreen(Widget screen) {
    _currentScreen = screen;
    notifyListeners();
  }
}
