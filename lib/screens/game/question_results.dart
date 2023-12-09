import 'package:flutter/material.dart';
import 'package:frases_argentinas/models/user_answer.dart';
import 'package:frases_argentinas/widgets/common/timer_bar.dart';
import 'package:frases_argentinas/widgets/game/question.dart';

class QuestionResults extends StatefulWidget {
  final String question;
  final String correctAnswer;
  final List<UserAnswer> usersAnswers;
  final int time;
  final List<String> options;

  const QuestionResults({
    Key? key,
    required this.question,
    required this.correctAnswer,
    required this.usersAnswers,
    required this.time,
    required this.options,
  }) : super(key: key);

  @override
  _QuestionResultsState createState() => _QuestionResultsState();
}

class _QuestionResultsState extends State<QuestionResults>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // Inicia la animación cuando la respuesta es incorrecta
    if (widget.usersAnswers.isNotEmpty) {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isWrongAnswerSelected =
        widget.usersAnswers.isNotEmpty &&
            widget.usersAnswers[0].answer != widget.correctAnswer;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TimerBar(time: widget.time),
        Question(question: widget.question),
        const SizedBox(height: 10),
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Opacity(
                opacity: _opacityAnimation.value,
                child: Text(
                  isWrongAnswerSelected ? 'INCORRECTO' : 'CORRECTO',
                  style: TextStyle(
                    color: isWrongAnswerSelected ? Colors.red : Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 10),
        Column(
          children: widget.options.map((option) {
            bool isCorrectAnswer = option == widget.correctAnswer;
            bool isSelected =
                widget.usersAnswers.isNotEmpty &&
                    widget.usersAnswers[0].answer == option;

            return Column(
              children: [
                Container(
                  height: 70,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(92, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isSelected
                          ? isCorrectAnswer
                              ? Colors.green
                              : Colors.red
                          : isCorrectAnswer && isWrongAnswerSelected
                              ? Colors.green
                              : Colors.white24,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          option,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      if (isSelected)
                        isCorrectAnswer
                            ? buildCorrectIcon()
                            : buildWrongIcon()
                      else if (isCorrectAnswer && isWrongAnswerSelected)
                        buildCorrectIcon()
                      else
                        const SizedBox.shrink(),
                    ],
                  ),
                ),
                const SizedBox(height: 10), // Espacio entre opciones
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}

Widget buildCorrectIcon() => const CircleAvatar(
      radius: 15,
      backgroundColor: Colors.green,
      child: Icon(
        Icons.check,
        color: Colors.white,
      ),
    );

Widget buildWrongIcon() => const CircleAvatar(
      radius: 15,
      backgroundColor: Colors.red,
      child: Icon(
        Icons.close,
        color: Colors.white,
      ),
    );


    
    /*
        return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Container(
        height: 70,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(92, 255, 255, 255),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: myAnswer == option? Colors.grey.shade600 :Colors.white24,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                option,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    
    */
    
    
    
    
    
    
    
    /*
    
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TimerBar(time: time),
        Question(question: question),
        const SizedBox(height: 10),
        const Text(
          'Respuesta correcta:',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        Text(
          correctAnswer,
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        const SizedBox(height: 20),
        Table(
          border: TableBorder.all(color: Colors.black),
          children: [
            TableRow(
              decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 185, 11, 69).withOpacity(0.3)),
              children: usersAnswers.map((answer) {
                Color cellColor = answer.answer == correctAnswer
                    ? Colors.green
                    : const Color.fromARGB(255, 255, 17, 0);
                return Center(
                  child: Text(
                    answer.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: cellColor,
                    ),
                  ),
                );
              }).toList(),
            ),
            TableRow(
              decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 233, 14, 87).withOpacity(0.1)),
              children: usersAnswers.map((answer) {
                Color cellColor = answer.answer == correctAnswer
                    ? Colors.green
                    : const Color.fromARGB(255, 255, 17, 0);
                return Center(
                  child: Text(
                    answer.answer,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: cellColor,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 24, 139, 95),
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(8),
          child: const Text(
            'PUNTAJES',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 2),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: usersAnswers
              .map((answer) => Text(
                    '${answer.name}: ${answer.points}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 235, 42, 161),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
    */