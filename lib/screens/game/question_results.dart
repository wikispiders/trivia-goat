import 'package:flutter/material.dart';
import 'package:frases_argentinas/app_services/app_services.dart';
import 'package:frases_argentinas/models/user_answer.dart';
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
  State<QuestionResults> createState() => _QuestionResultsState();
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
      duration: const Duration(milliseconds: 500),
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
    final userAnswer = widget.usersAnswers.firstWhere((p) => p.name == AppServices().usernameProvider.username);
    print('El name es ${userAnswer.name}');
    final myAnswer = userAnswer.answer;

    bool isWrongAnswerSelected =
        widget.usersAnswers.isNotEmpty && myAnswer != widget.correctAnswer;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
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
                  isWrongAnswerSelected ? 'INCORRECT' : 'CORRECT',
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
            bool isSelected = option == myAnswer;

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
        Question(question: question),
        const SizedBox(height: 20),
        Text(
          correctAnswer,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 22, 206, 22),
          ),
        ),
        const SizedBox(height: 20),
        Column(
          children: usersAnswers
              .map((answer) => UserAnswerWidget(
                    userAnswer: answer,
                    correctAnswer: correctAnswer,
                  ))
              .toList(),
        ),
      ],
    );
    */