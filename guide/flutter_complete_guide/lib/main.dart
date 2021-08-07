import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';
import 'package:flutter_complete_guide/question.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        'Black',
        'Red',
        'Green',
        'White',
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        'Rabbit',
        'Snake',
        'Elephant',
        'Lion',
      ]
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        'Max',
        'Max',
        'Max',
        'Max',
      ]
    },
  ];

  var _questionIndex = 0;

  void answerQuestion() {
    if (this._questionIndex < this.questions.length) {}

    setState(() {
      this._questionIndex = this._questionIndex + 1;
    });
    print(this._questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Question(this.questions[_questionIndex]['questionText'] as String),
            ...(this.questions[_questionIndex]['answers'] as List<String>)
                .map((answer) => Answer(this.answerQuestion, answer))
                .toList(),
          ],
        ),
      ),
    );
  }
}
