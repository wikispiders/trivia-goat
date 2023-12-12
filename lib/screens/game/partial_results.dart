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
  _PartialResultsScreenState createState() => _PartialResultsScreenState();
}

class _PartialResultsScreenState extends State<PartialResultsScreen> {
  late List<PlayerData> playerDataList;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    playerDataList = widget.usersAnswers.map((e) => PlayerData(e.name[0], e.name, e.points)).toList();

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        playerDataList.sort((a, b) => b.score.compareTo(a.score));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors
          .transparent, //SI ROMPE POR AHI ES ACA. ESTA LINEA NO ESTA TESTEADA
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
        areItemsTheSame: (a, b) => a.playerNumber == b.playerNumber,
      ),
    );
  }
}
