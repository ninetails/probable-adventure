import 'package:flutter/material.dart';
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
      'What\'s your favorite color?',
      'What\'s your favorite animal?',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Question(questions[questionIndex]),
            ElevatedButton(
              child: Text('Answer 1'),
              onPressed: this.answerQuestion,
            ),
            ElevatedButton(
              child: Text('Answer 2'),
              onPressed: this.answerQuestion,
            ),
            ElevatedButton(
              child: Text('Answer 3'),
              onPressed: this.answerQuestion,
            ),
          ],
        ),
      ),
    );
  }
}
