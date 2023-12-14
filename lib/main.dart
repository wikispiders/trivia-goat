import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trivia_goat/app_services/app_services.dart';
import 'package:trivia_goat/provider/app_state_provider.dart';
import 'package:trivia_goat/widgets/common/title_widget.dart';
import 'package:trivia_goat/screens/lobby/splash_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  Fluttertoast.showToast;
  await dotenv.load(fileName: ".env");
  runApp(const TriviaApp());
}

class TriviaApp extends StatelessWidget {
  const TriviaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppServices().usernameProvider),
        ChangeNotifierProvider(create: (_) => AppServices().appStateProvider),
        ChangeNotifierProvider(create: (_) => AppServices().lobbyProvider),
        ChangeNotifierProvider(create: (_) => AppServices().gameStateProvider),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        ).copyWith(),
        home: Consumer<AppStateProvider>(
          builder: (context, appStateProvider, child) {
            if (appStateProvider.currentScreen is SplashScreen) {
              return appStateProvider.currentScreen;
            } else {
              return Scaffold(
                appBar: TitleWidget(appStateProvider.currentScreen),
                body: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: appStateProvider.currentScreen,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
