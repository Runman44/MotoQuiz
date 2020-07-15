import 'package:flutter/material.dart';
import 'package:motorquiz/main.dart';
import 'package:motorquiz/answer.dart';
import 'package:motorquiz/question.dart';

class Quiz extends StatelessWidget {
  final List<Question> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({@required this.questions, @required this.questionIndex, @required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          QuestionCard(questions[questionIndex].question),
          ...questions[questionIndex]
              .answers
              .map((answer) => AnswerButton(answer, () => answerQuestion(answer.isCorrect, questions[questionIndex].description))),
        ],
      ),
    );
  }
}
