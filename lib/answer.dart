import 'package:flutter/material.dart';

import 'main.dart';

class AnswerButton extends StatelessWidget {
  final Answer answer;
  final Function selectHandler;

  AnswerButton(this.answer, this.selectHandler);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: Text(answer.answer, textAlign: TextAlign.center,),
      ),
      color: Theme.of(context).accentColor,
      textColor: Colors.white,
      onPressed: selectHandler,
    );
  }
}
