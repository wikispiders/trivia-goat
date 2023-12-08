import 'package:flutter/material.dart';
import 'package:frases_argentinas/app_services/app_services.dart';
import 'package:frases_argentinas/screens/lobby/home_screen.dart';
import 'package:frases_argentinas/screens/lobby/constants.dart';


class JoinHome extends StatefulWidget {
  const JoinHome({super.key});

  @override
  State<JoinHome> createState() => _JoinHomeState();
}


class _JoinHomeState extends State<JoinHome> {
  TextEditingController _controller = TextEditingController();


 @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 217, 229),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              'https://cdn-icons-png.flaticon.com/512/119/119686.png',
              width: 300,
              height: 300,
            ),
            
             Text(
                        'Join an Existing Game!',
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
                controller: _controller,
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
              hintText: 'Insert an ID Game',
              hintStyle: kHintTextStyle,
            ),
              ),
            ),

            SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: ()=> AppServices().middlewareService.join(_controller.text),
              icon: Icon(Icons.start),
              label: Text(
                  'Join Game',
                  style: TextStyle(fontSize: 28),  // Ajusta el tamaño del texto según tus necesidades
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
            SizedBox(height: 70),
             ElevatedButton.icon(
              onPressed: ()=> AppServices().appStateProvider.setScreen(HomeScreen()),
              icon: Icon(Icons.restart_alt),
              label: Text(
                  'Back',
                  style: TextStyle(fontSize: 20),  // Ajusta el tamaño del texto según tus necesidades
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















/*
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0), // Ajusta el espaciado según sea necesario
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.pink,
          width: 5.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: _controller,
            decoration: InputDecoration(
            hintText: 'Inserte un ID de juego',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 15.0,),
            labelText: 'Unirse a una partida',
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0,)),
            
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              AppServices().middlewareService.join(_controller.text);
              
            },
            child: Text('UNIRSE'),
          ),
                    ElevatedButton(
           onPressed: ()=> AppServices().appStateProvider.setScreen(HomeScreen()),
            child: Text('VOLVER'),
          ),
        ],
      ),
    );
  }
}


*/