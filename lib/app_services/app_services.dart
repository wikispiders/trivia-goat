import 'package:trivia_goat/middleware/middleware.dart';
import 'package:trivia_goat/provider/app_state_provider.dart';
import 'package:trivia_goat/provider/game_state_provider.dart';
import 'package:trivia_goat/provider/lobby_provider.dart';
import 'package:trivia_goat/provider/username_provider.dart';

class AppServices {
  static final AppServices _instance = AppServices._internal();

  factory AppServices() {
    return _instance;
  }

  AppServices._internal(): 
    middlewareService = Middleware(),
    usernameProvider = UsernameProvider(),
    lobbyProvider = LobbyProvider(),
    gameStateProvider = GameStateProvider(),
    appStateProvider = AppStateProvider();

  Middleware middlewareService;
  UsernameProvider usernameProvider;
  AppStateProvider appStateProvider;
  GameStateProvider gameStateProvider;
  LobbyProvider lobbyProvider;
}
