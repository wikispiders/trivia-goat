import 'package:frases_argentinas/middleware/middleware.dart';
import 'package:frases_argentinas/provider/app_state_provider.dart';
import 'package:frases_argentinas/provider/game_state_provider.dart';
import 'package:frases_argentinas/provider/lobby_provider.dart';
import 'package:frases_argentinas/provider/username_provider.dart';

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
