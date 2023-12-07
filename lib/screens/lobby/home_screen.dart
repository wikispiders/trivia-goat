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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
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
              decoration: InputDecoration(hintText: 'Nombre de jugador',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 15.0,),
            labelText: 'Ingrese su nombre',
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0,)),
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
          
        ],
      ),
    );
  }
}
