import 'package:frases_argentinas/app_services/app_services.dart';
import 'package:frases_argentinas/event_handler/server_event_handler.dart';
import 'package:frases_argentinas/screens/lobby/lobby_screen.dart';

class CreateSuccessfulHandler extends ServerEventHandler {
  final int gameId;

  CreateSuccessfulHandler(this.gameId);

  @override
  bool execute() {
    final String creator = AppServices().usernameProvider.username;
    AppServices().lobbyProvider.setPlayers([creator], creator);
    AppServices().appStateProvider.setScreen(LobbyScreen(isCreator: true, gameId: gameId));
    return true;
  }
}
