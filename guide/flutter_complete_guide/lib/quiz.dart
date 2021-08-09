import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';
import 'package:flutter_complete_guide/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final VoidCallback answerQuestion;

  const Quiz({
    Key? key,
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          this.questions[this.questionIndex]['questionText'] as String,
        ),
        ...(this.questions[this.questionIndex]['answers'] as List<String>)
            .map((answer) => Answer(this.answerQuestion, answer))
            .toList(),
      ],
    );
  }
}
