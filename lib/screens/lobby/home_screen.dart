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
            ElevatedButton.icon(
              onPressed: AppServices().middlewareService.create,
              icon: Icon(Icons.games),
              label: Text(
                  'New Game',
                  style: TextStyle(fontSize: 25),  // Ajusta el tamaño del texto según tus necesidades
                ),
                style: ButtonStyle(
                elevation: MaterialStateProperty.all<double>(5.0), // Ajusta el valor según tus necesidades
                shadowColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 255, 136, 175)), // Ajusta el color de la sombra según tus necesidades
                shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0), // Ajusta el radio de la esquina según tus necesidades
                ),
              ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: ()=> AppServices().appStateProvider.setScreen(JoinHome()),
              icon: Icon(Icons.start),
              label: Text(
                  'Join Game',
                  style: TextStyle(fontSize: 25),  // Ajusta el tamaño del texto según tus necesidades
                ),
              style: ButtonStyle(
                elevation: MaterialStateProperty.all<double>(5.0), // Ajusta el valor según tus necesidades
                shadowColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 255, 136, 175)), // Ajusta el color de la sombra según tus necesidades
                shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0), // Ajusta el radio de la esquina según tus necesidades
                ),
              ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).viewInsets.bottom),

          ],
        ),
      ),
    );
  }
}