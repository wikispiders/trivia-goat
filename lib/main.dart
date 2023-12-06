import 'package:flutter/material.dart';
import 'package:frases_argentinas/app_services/app_services.dart';
import 'package:frases_argentinas/provider/app_state_provider.dart';
import 'package:frases_argentinas/widgets/common/title_widget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
              return Scaffold(
                appBar: const TitleWidget(),
                body: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: appStateProvider.currentScreen),
                ),
              );
            },
          )),
    );
  }
}
