import 'package:quiz_app/models/answer.dart';

class Question {
  final String questionText;
  final List<Answer> answers;

  const Question(this.questionText, this.answers);
}