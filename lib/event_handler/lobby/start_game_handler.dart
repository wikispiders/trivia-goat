import 'package:frases_argentinas/app_services/app_services.dart';
import 'package:frases_argentinas/event_handler/server_event_handler.dart';
import 'package:frases_argentinas/screens/lobby/starting_game_screen.dart';

class StartGameHandler extends ServerEventHandler {
  int time;

  StartGameHandler(this.time);

  @override
  bool execute() {
    AppServices().appStateProvider.setScreen(StartingGameScreen(timeToStart: time));
    return true;
  }
}
