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
  var questionIndex = 0;

  void answerQuestion() {
    setState(() {
      questionIndex = questionIndex + 1;
    });
    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
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

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Question(questions[questionIndex]),
            Answer(this.answerQuestion),
            Answer(this.answerQuestion),
            Answer(this.answerQuestion),
          ],
        ),
      ),
    );
  }
}
