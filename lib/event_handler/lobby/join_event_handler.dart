import 'package:frases_argentinas/app_services/app_services.dart';
import 'package:frases_argentinas/event_handler/server_event_handler.dart';
import 'package:frases_argentinas/screens/lobby/lobby_screen.dart';

class JoinSuccessfulHandler extends ServerEventHandler {
  List<String> players;
  String newPlayer;
  int gameid;

  JoinSuccessfulHandler(this.players, this.newPlayer, this.gameid);

  bool _lastJoinedIsMe() {
    return newPlayer == AppServices().usernameProvider.username;
  }

  @override
  bool execute() {
    AppServices().lobbyProvider.setPlayers(players, players.first);
    if (_lastJoinedIsMe()) {
      AppServices().appStateProvider.setScreen(LobbyScreen(isCreator: false, gameId: gameid));
    }
    return true;
  }
}
