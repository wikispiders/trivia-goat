import 'package:flutter/material.dart';
import 'package:frases_argentinas/app_services/app_services.dart';
import 'package:frases_argentinas/screens/lobby/home_screen.dart';

class JoinHome extends StatefulWidget {
  const JoinHome({super.key});

  @override
  State<JoinHome> createState() => _JoinHomeState();
}

class _JoinHomeState extends State<JoinHome> {
  TextEditingController _controller = TextEditingController();

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
