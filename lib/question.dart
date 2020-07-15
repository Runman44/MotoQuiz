import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  final String questionText;

  QuestionCard(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
            return FractionallySizedBox(
              widthFactor: constraints.maxWidth < 600 ? 1.0 : 0.5,
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          questionText,
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
      ),
    );
  }
}
