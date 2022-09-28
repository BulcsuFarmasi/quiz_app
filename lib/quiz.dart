import 'package:flutter/material.dart';

import 'package:quiz_app/answer.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/models/question.dart' as question;

class Quiz extends StatelessWidget {
  final List<question.Question> questions;
  final int questionIndex;
  final Function answerQuestion;

  const Quiz({
    required this.answerQuestion,
    required this.questions,
    required this.questionIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(questions[questionIndex].questionText),
        ...(questions[questionIndex].answers).map((answer) {
          return Answer(answer.text, () => answerQuestion(answer.score));
        }).toList(),
      ],
    );
  }
}
