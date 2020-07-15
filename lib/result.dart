import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalCorrect;
  final int totalQuestions;
  final Function onRetryHandler;

  Result(this.totalCorrect, this.totalQuestions, this.onRetryHandler);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Je bent klaar!", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          Text("Je hebt $totalCorrect van de $totalQuestions goed!"),
          SizedBox(height: 50,),
          RaisedButton(
            child: Text("Opnieuw"),
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            onPressed: onRetryHandler,
          ),
        ],
      ),
    );
  }
}
