import 'package:flutter/material.dart';
import 'package:motorquiz/Result.dart';

import 'quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mr.Anderson Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Motor Quiz'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _questionIndex = 0;
  var _totalCorrect = 0;

  final List<Question> _questions = [
    Question(
        question:
            "Hoe doe je dit yfsa fds ffdsfdsfdsd sfds ffdsfdsfddsfds fa fdsfdafdsfdsfdsfasdfdsaf dsf dsf  ds afdsfdsafsfdfdsafdsfdasfdsafdsfdsfda?",
        answers: [
          Answer(answer: "Wellus", isCorrect: true),
          Answer(answer: "Nietus")
        ],
        description: "Het was wellus omdat, dit en dat"),
    Question(
        question: "Hoe doe je fdsfdsdit?",
        answers: [
          Answer(answer: "Welfsdlus", isCorrect: true),
          Answer(answer: "Nifdsetus")
        ],
        description: "Het wfdsas wellus omdat, dit en dat"),
  ];

  void _answerQuestion(bool isCorrect, String description) {
    if (isCorrect) {
      _totalCorrect++;
    }

    showDialog(
      context: context,
      child: AlertDialog(
        title: Text(isCorrect ? "Correct" : "Fout"),
        content: Text(description),
        actions: [
          FlatButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );

    setState(() {
      _questionIndex++;
    });
  }

  void _reset() {
    setState(() {
      _totalCorrect = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              questions: _questions,
              questionIndex: _questionIndex,
              answerQuestion: _answerQuestion)
          : Result(_totalCorrect, _questions.length, _reset),
    );
  }
}

class Question {
  String question;
  List<Answer> answers;
  String description;

  Question({this.question, this.answers, this.description});
}

class Answer {
  String answer;
  bool isCorrect;

  Answer({this.answer, this.isCorrect = false});
}
