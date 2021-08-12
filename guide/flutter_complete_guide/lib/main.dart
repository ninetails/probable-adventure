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
      // theme: ThemeData(
      //   primaryColor: Colors.red,
      // ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                // style: ButtonStyle(
                //   backgroundColor: MaterialStateProperty.all(Colors.orange),
                //   foregroundColor: MaterialStateProperty.all(Colors.white),
                // ),
                style: ElevatedButton.styleFrom(
                  /// [primary] here means to background
                  primary: Colors.orange,
                  onPrimary: Colors.white,
                ),
                child: Text('A Raised Button'),
                onPressed: () => print('Pressed raised button'),
              ),
              TextButton(
                child: Text('A Flat Button'),
                // style: ButtonStyle(
                //   foregroundColor: MaterialStateProperty.all(Colors.orange),
                //   backgroundColor: MaterialStateProperty.all(Colors.black12),
                // ),
                style: TextButton.styleFrom(
                  /// while [primary] here means to foreground
                  primary: Colors.orange,

                  /// also [onPrimary] is absent because you don't set background color,
                  /// if you need a background color, just switch to [ElevatedButton]
                ),
                onPressed: () => print('Pressed flat button'),
              ),
              OutlinedButton(
                // style: ButtonStyle(
                //   side: MaterialStateProperty.all(
                //     BorderSide(
                //       color: Colors.red,
                //       style: BorderStyle.solid,
                //     ),
                //   ),
                // ),
                style: OutlinedButton.styleFrom(
                  primary: Colors.orange,
                  side: BorderSide(
                    color: Colors.orange,
                  ),
                ),
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
