import 'dart:convert';
import 'package:frases_argentinas/event_handler/game/answer_submitted_handler.dart';
import 'package:frases_argentinas/event_handler/game/question_received_handler.dart';
import 'package:frases_argentinas/event_handler/game/question_results_handler.dart';
import 'package:frases_argentinas/event_handler/lobby/create_event_handler.dart';
import 'package:frases_argentinas/event_handler/lobby/join_event_handler.dart';
import 'package:frases_argentinas/event_handler/lobby/start_game_handler.dart';
import 'package:frases_argentinas/models/user_answer.dart';

abstract class ServerEventHandler {  
  bool execute();

  static ServerEventHandler fromEncodedData(String data) {
    final decodedData = jsonDecode(data);
    final String? eventType = decodedData['event'];
    print('Entra bien $decodedData');
    switch (eventType) {
      case 'create':
        if (decodedData.containsKey('gameid')) {
          return CreateSuccessfulHandler(decodedData['gameid']);
        }
      case 'join':
        if (decodedData.containsKey('players') && decodedData.containsKey('new_player') && decodedData.containsKey('gameid')) {
          return JoinSuccessfulHandler(decodedData['players'].cast<String>(), decodedData['new_player'], decodedData['gameid']);
        }
      case 'start':
        if (decodedData.containsKey('time')) {
          return StartGameHandler(decodedData['time']);
        }
      case 'question':
        if (decodedData.containsKey('question') && decodedData.containsKey('options') && decodedData.containsKey('time')) {
          return QuestionReceivedHandler(decodedData['question'], decodedData['options'].cast<String>(), decodedData['time']);
        }
      case 'answer_submitted':
        if (decodedData.containsKey('answer') && decodedData.containsKey('question')) {
          return AnswerSubmittedHandler(decodedData['question'], decodedData['answer']);
        }
      case 'question_results':
        if (decodedData.containsKey('question') && decodedData.containsKey('correct_answer') 
            && decodedData.containsKey('players_answers') && decodedData.containsKey('time_next_event')) {
          return QuestionResultsHandler(decodedData['question'], decodedData['correct_answer'], 
                                        List<UserAnswer>.from(decodedData['players_answers'].map((element) => UserAnswer.fromJson(element))),
                                        decodedData['time_next_event']);
        }

      default:
        throw FormatException('Invalid event: $decodedData');
    }
    throw FormatException('Incomplete data for submit_answer event: $decodedData');
  }

}