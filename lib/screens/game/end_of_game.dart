import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pink[50],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'El Resultado Final es...',
                style: TextStyle(
                  color: Colors.pink,
                  fontFamily: 'OpenSans',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              // Ejemplo con 1 jugador
              PodiumAvatar(
                playerName: 'Player 1',
                rank: 1,
              ),
              SizedBox(height: 10),
              // Ejemplo con 2 jugadores
              PodiumAvatar(
                playerName: 'Player 2',
                rank: 2,
              ),
              SizedBox(height: 10),
              // Ejemplo con 3 jugadores
              PodiumAvatar(
                playerName: 'Player 3',
                rank: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PodiumAvatar extends StatelessWidget {
  final String playerName;
  final int rank;

  const PodiumAvatar({required this.playerName, required this.rank, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Column(
        children: [
          if (rank == 1)
            Image.network(
              'https://cdn-icons-png.flaticon.com/512/1910/1910476.png', // Medalla de Oro
              height: 140,
            ),
          if (rank == 2)
            Image.network(
              'https://cdn-icons-png.flaticon.com/512/1910/1910479.png', // Medalla de Plata
              height: 120,
            ),
          if (rank == 3)
            Image.network(
              'https://cdn-icons-png.flaticon.com/512/1910/1910485.png', // Medalla de Bronce
              height: 110,
            ),
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.pink[400],
            child: CircleAvatar(
              radius: 20,
              child: Text(
                playerName[0], // Muestra la primera letra del nombre
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            playerName,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
