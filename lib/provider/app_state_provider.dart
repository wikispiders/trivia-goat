import 'package:flutter/material.dart';
import 'package:frases_argentinas/screens/lobby/home_screen.dart';
import 'package:frases_argentinas/screens/lobby/splash_screen.dart';

class AppStateProvider extends ChangeNotifier {
  Widget _currentScreen = SplashScreen();

  Widget get currentScreen => _currentScreen;

  void setScreen(Widget screen) {
    _currentScreen = screen;
    notifyListeners();
  }
}
