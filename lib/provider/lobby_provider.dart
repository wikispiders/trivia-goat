import 'package:flutter/material.dart';

class LobbyProvider extends ChangeNotifier {
  List<String> _players = [];
  String _creator = '';

  List<String> get players => _players;
  String get creator => _creator;

  void setPlayers(List<String> players, String creator) {
    _creator = creator;
    _players = players;
    notifyListeners();
  }
}
