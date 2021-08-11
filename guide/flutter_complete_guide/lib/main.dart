import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {
          'text': 'Black',
          'score': 10,
        },
        {
          'text': 'Red',
          'score': 5,
        },
        {
          'text': 'Green',
          'score': 3,
        },
        {
          'text': 'White',
          'score': 1,
        },
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {
          'text': 'Rabbit',
          'score': 3,
        },
        {
          'text': 'Snake',
          'score': 11,
        },
        {
          'text': 'Elephant',
          'score': 5,
        },
        {
          'text': 'Lion',
          'score': 9,
        },
      ]
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {
          'text': 'Max',
          'score': 1,
        },
        {
          'text': 'Max',
          'score': 1,
        },
        {
          'text': 'Max',
          'score': 1,
        },
        {
          'text': 'Max',
          'score': 1,
        },
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      this._questionIndex = 0;
      this._totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    if (this._questionIndex < this._questions.length) {}

    this._totalScore += score;

    setState(() {
      this._questionIndex = this._questionIndex + 1;
    });
    print(this._questionIndex);
  }

  @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: Scaffold(
  //       appBar: AppBar(
  //         title: Text('My First App'),
  //       ),
  //       body: this._questionIndex < this._questions.length
  //           ? Quiz(
  //               answerQuestion: this._answerQuestion,
  //               questionIndex: this._questionIndex,
  //               questions: this._questions,
  //             )
  //           : Result(this._totalScore, this._resetQuiz),
  //     ),
  //   );
  // }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text('A Raised Button'),
                onPressed: () => print('Pressed raised button'),
              ),
              FlatButton(
                child: Text('A Flat Button'),
                textColor: Colors.blue,
                onPressed: () => print('Pressed flat button'),
              ),
              OutlineButton(
                borderSide: BorderSide(
                  color: Colors.blue,
                ),
                textColor: Colors.blue,
                child: Text('An Outline Button'),
                onPressed: () => print('Pressed outline button'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
