import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animated_list_plus/animated_list_plus.dart';
import 'package:animated_list_plus/transitions.dart';
import 'package:frases_argentinas/widgets/game/player_result.dart';
import '../../models/user_answer.dart';


class PartialResultsScreen extends StatefulWidget {
  final String question;
  final String correctAnswer;
  final List<UserAnswer> usersAnswers;
  final int time;
  
  const PartialResultsScreen({
    Key? key,
    required this.question,
    required this.correctAnswer,
    required this.usersAnswers,
    required this.time,
  }) : super(key: key);


  @override
  State<PartialResultsScreen> createState() => _PartialResultsScreenState();
}

class _PartialResultsScreenState extends State<PartialResultsScreen> {
  late List<PlayerData> playerDataList;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late Timer timer;
  int ticks = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      playerDataList = widget.usersAnswers.map((e) => PlayerData(e.name[0], e.name, e.points - e.partialPoints, e.answer, e.answer == widget.correctAnswer)).toList();
    });
    
    const frameRate = 100; 
    final int nLoops = widget.time * 1000 ~/ frameRate ~/ 2; // para que dure la mitad del tiempo la animacion y al final quede estatico.

    timer = Timer.periodic(const Duration(milliseconds: frameRate), (Timer timer) { 
      final newPlayerDataList = widget.usersAnswers.map((e) => PlayerData(e.name[0], e.name, e.points - e.partialPoints + e.partialPoints * (ticks+1) ~/nLoops, e.answer, e.answer == widget.correctAnswer)).toList();
      setState(() {
        playerDataList = newPlayerDataList;
        ticks+=1;
        if (ticks >= nLoops) {
          playerDataList.sort((a, b) => b.score.compareTo(a.score));
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel(); 
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ImplicitlyAnimatedList<PlayerData>(
        key: _listKey,
        items: playerDataList,
        itemBuilder: (context, animation, playerData, index) {
          return SizeFadeTransition(
            sizeFraction: 0.7,
            animation: animation,
            child: Padding(
              key: ValueKey(playerData.playerNumber),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: PlayerResultWidget(playerData: playerData),
            ),
          );
        },
        areItemsTheSame: (a, b) => a.playerName == b.playerName,
      ),
    );
  }
}
