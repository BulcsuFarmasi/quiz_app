import 'package:flutter/material.dart';
import 'package:quiz_app/models/answer.dart';
import 'package:quiz_app/models/question.dart';

import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AppState();
  }
}

class _AppState extends State<App> {
  final _questions = const [
    Question("What's your favorite color?", [
      Answer('Black', 10),
      Answer('Red', 5),
      Answer('Green', 3),
      Answer('White', 11),
    ]),
    Question("What's your favorite animal?", [
      Answer('Rabbit', 3),
      Answer('Snake', 11),
      Answer('Elephant', 5),
      Answer('Lion', 9),
    ]),
    Question("Who's your favorite instructor?", [
      Answer('Max', 1),
      Answer('Max', 1),
      Answer('Max', 1),
      Answer('Max', 1),
    ]),
  ];

  int _questionIndex = 0;
  int _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex++;
    });
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
          answerQuestion: _answerQuestion,
          questionIndex: _questionIndex,
          questions: _questions,
        )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}