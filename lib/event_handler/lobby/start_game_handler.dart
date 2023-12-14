import 'package:trivia_goat/app_services/app_services.dart';
import 'package:trivia_goat/event_handler/server_event_handler.dart';
import 'package:trivia_goat/screens/lobby/starting_game_screen.dart';

class StartGameHandler extends ServerEventHandler {
  int time;

  StartGameHandler(this.time);

  @override
  bool execute() {
    AppServices().appStateProvider.setScreen(StartingGameScreen(timeToStart: time));
    return true;
  }
}
