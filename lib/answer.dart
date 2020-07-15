import 'package:flutter/material.dart';

import 'main.dart';

class AnswerButton extends StatelessWidget {
  final Answer answer;
  final Function selectHandler;

  AnswerButton(this.answer, this.selectHandler);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(answer.answer),
      color: Theme.of(context).accentColor,
      textColor: Colors.white,
      onPressed: selectHandler,
    );
  }
}
