import 'package:flutter/material.dart';
import 'package:frases_argentinas/app_services/app_services.dart';
import 'package:frases_argentinas/provider/username_provider.dart';
import 'package:frases_argentinas/widgets/lobby/join_home.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

@override
  Widget build(BuildContext context) {
    UsernameProvider userNameProvider = Provider.of<UsernameProvider>(context);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 217, 229),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              'https://opentdb.com/images/logo.png',
              width: 300,
              height: 300,
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.pink,
                  width: 5.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextField(
                onChanged: userNameProvider.setUsername,
                decoration: InputDecoration(
                  hintText: 'Player Game',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15.0),
                  labelText: 'Insert your name',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: AppServices().middlewareService.create,
              child: Text('NUEVA PARTIDA'),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: ()=> AppServices().appStateProvider.setScreen(JoinHome()),
              child: Text('UNIRSE A UNA PARTIDA'),
            ),
            SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
          ],
        ),
      ),
    );
  }
}