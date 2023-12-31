import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:trivia_goat/app_services/app_services.dart';
import 'package:trivia_goat/client_messages/play_again.dart';

import '../../models/user_answer.dart';


class EndOfGame extends StatelessWidget {
  final List<UserAnswer> usersAnswers;
  
  const EndOfGame({
    Key? key,
    required this.usersAnswers,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    List<UserAnswer> orderedAnswers = usersAnswers.toList();
    orderedAnswers.sort((a, b) => b.points - a.points);
    orderedAnswers = orderedAnswers.sublist(0, min(orderedAnswers.length, 3));

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Podium!',
                  style: TextStyle(
                    color: Color.fromARGB(255, 236, 10, 86),
                    fontFamily: 'OpenSans',
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                PodiumList(orderedAnswers: orderedAnswers),
                const SizedBox(height: 10),
                FutureBuilder<void>(
                  future: Future.delayed(Duration(seconds: 1+orderedAnswers.length*2)),
                  builder: (context, snapshot) => snapshot.connectionState == ConnectionState.done
                    ? ElevatedButton(
                        onPressed: (){AppServices().middlewareService.sendMessage(PlayAgain());},
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
                      ): const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}




class PodiumList extends StatelessWidget {
  final List<UserAnswer> orderedAnswers;
  const PodiumList({super.key, required this.orderedAnswers});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: orderedAnswers.length,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            FutureBuilder<void>(
              future: Future.delayed(Duration(seconds: 1 + index * 2)),
              builder: (context, snapshot) => snapshot.connectionState == ConnectionState.done
                  ? PodiumAvatar(
                      playerName: orderedAnswers[index].name,
                      rank: index+1,
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        );
      }
    );
  }
} 























class PodiumAvatar extends StatefulWidget {
  final String playerName;
  final int rank;

  const PodiumAvatar({required this.playerName, required this.rank, Key? key})
      : super(key: key);

  @override
  State<PodiumAvatar> createState() => _PodiumAvatarState();
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
      duration: const Duration(milliseconds: 600),
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
      child: SizedBox(
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
              Image.asset('assets/oro.png', height: 100,),
            if (widget.rank == 2)
              Image.asset('assets/plata.png', height: 80,),
            if (widget.rank == 3)
              Image.asset('assets/bronce.png', height: 60,),
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.pink[400],
              child: CircleAvatar(
                radius: 20,
                child: Text(
                  widget.playerName[0], 
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              widget.playerName,
              style: const TextStyle(
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
