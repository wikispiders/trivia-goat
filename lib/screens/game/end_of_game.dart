import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

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
              
              FutureBuilder<void>(
                future: Future.delayed(Duration(seconds: 1)),
                builder: (context, snapshot) => snapshot.connectionState == ConnectionState.done
                    ? PodiumAvatar(
                        playerName: 'Player 1',
                        rank: 1,
                      )
                    : SizedBox.shrink(),
              ),
              SizedBox(height: 10),
              
              FutureBuilder<void>(
                future: Future.delayed(Duration(seconds: 3)),
                builder: (context, snapshot) => snapshot.connectionState == ConnectionState.done
                    ? PodiumAvatar(
                        playerName: 'Player 2',
                        rank: 2,
                      )
                    : SizedBox.shrink(),
              ),
              SizedBox(height: 10),
              
              FutureBuilder<void>(
                future: Future.delayed(Duration(seconds: 5)),
                builder: (context, snapshot) => snapshot.connectionState == ConnectionState.done
                    ? PodiumAvatar(
                        playerName: 'Player 3',
                        rank: 3,
                      )
                    : SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PodiumAvatar extends StatefulWidget {
  final String playerName;
  final int rank;

  const PodiumAvatar({required this.playerName, required this.rank, Key? key})
      : super(key: key);

  @override
  _PodiumAvatarState createState() => _PodiumAvatarState();
}

class _PodiumAvatarState extends State<PodiumAvatar> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Container(
        width: 200,
        child: Column(
          children: [
            if (widget.rank == 1)
              Image.network(
                'https://cdn-icons-png.flaticon.com/512/1910/1910476.png', // Medalla de Oro
                height: 140,
              ),
            if (widget.rank == 2)
              Image.network(
                'https://cdn-icons-png.flaticon.com/512/1910/1910479.png', // Medalla de Plata
                height: 120,
              ),
            if (widget.rank == 3)
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
                  widget.playerName[0], // Muestra la primera letra del nombre
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              widget.playerName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
