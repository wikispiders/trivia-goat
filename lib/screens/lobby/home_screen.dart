import 'package:flutter/material.dart';
import 'package:frases_argentinas/app_services/app_services.dart';
import 'package:frases_argentinas/provider/username_provider.dart';
import 'package:frases_argentinas/widgets/lobby/join_home.dart';
import 'package:provider/provider.dart';

import 'package:frases_argentinas/screens/lobby/constants.dart';

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
             Text(
                        'Welcome!',
                        style: TextStyle(
                          color: Colors.pink,
                          fontFamily: 'OpenSans',
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
            Container(
              alignment: Alignment.centerLeft,
              decoration: kBoxDecorationStyle,
              height: 60.0,
              child: TextField(
                onChanged: userNameProvider.setUsername,
              style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
              decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 1.0),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              hintText: 'Enter your Name',
              hintStyle: kHintTextStyle,
            ),
              ),
            ),

            SizedBox(height: 50),
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
