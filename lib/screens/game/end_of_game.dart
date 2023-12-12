import 'dart:async';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:frases_argentinas/global/common/constants.dart';

import '../../models/user_answer.dart';


class EndOfGame extends StatelessWidget {
  final List<UserAnswer> usersAnswers;
  
  const EndOfGame({
    Key? key,
    required this.usersAnswers,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pink[50],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
              alignment: Alignment.center,
              decoration: kBoxDecorationStyle,
              height: 60.0,
              width: 200,
              child: Text(
                'Podium!',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
              SizedBox(height: 10),
              FutureBuilder<void>(
                future: Future.delayed(Duration(seconds: 1)),
                builder: (context, snapshot) => snapshot.connectionState == ConnectionState.done
                    ? PodiumAvatar(
                        playerName: 'Milagros',
                        rank: 1,
                      )
                    : SizedBox.shrink(),
              ),
              SizedBox(height: 10),
              FutureBuilder<void>(
                future: Future.delayed(Duration(seconds: 3)),
                builder: (context, snapshot) => snapshot.connectionState == ConnectionState.done
                    ? PodiumAvatar(
                        playerName: 'Mateo',
                        rank: 2,
                      )
                    : SizedBox.shrink(),
              ),
              SizedBox(height: 10),
              FutureBuilder<void>(
                future: Future.delayed(Duration(seconds: 5)),
                builder: (context, snapshot) => snapshot.connectionState == ConnectionState.done
                    ? PodiumAvatar(
                        playerName: 'Tomas',
                        rank: 3,
                      )
                    : SizedBox.shrink(),
              ),
              SizedBox(height: 10),
              FutureBuilder<void>(
                future: Future.delayed(Duration(seconds: 7)),
                builder: (context, snapshot) => snapshot.connectionState == ConnectionState.done
                    ? ElevatedButton(
              onPressed: (){},
                style: ButtonStyle(
                elevation: MaterialStateProperty.all<double>(5.0), 
                shadowColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 255, 136, 175)), 
                shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0), 
                ),
              ),
              ),
              
              child: const Text('PLAY AGAIN'),
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
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _confettiController = ConfettiController(duration: const Duration(seconds: 1));

    _controller.forward();
    _confettiController.play();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Container(
        width: 200,
        child: Column(
          children: [
            ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              colors: const [Colors.yellow, Colors.amber, Colors.orange],
              numberOfParticles: 50,
            ),
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
                  widget.playerName[0], 
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
    _confettiController.dispose();
    super.dispose();
  }
}
