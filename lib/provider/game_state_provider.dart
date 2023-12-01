import 'package:flutter/material.dart';

class GameStateProvider extends ChangeNotifier {
  String _currentQuestion = '';
  List<String> _options = [];
  String? _myAnswer;
  
  String get currentQuestion => _currentQuestion;
  List<String> get options => _options;
  String? get myAnswer => _myAnswer;
  
  void setNewQuestion(String question, List<String> options) {
    _currentQuestion = question;
    _options = options;
    _myAnswer = null;
    notifyListeners();
  }

  void setAnswer(String question, String answer) {
    if (question != _currentQuestion) {
      print('La pregunta $question no esta mas.');
      return;
    }
    _myAnswer = answer;
    notifyListeners();
  }

}
