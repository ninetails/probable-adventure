import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;

  const Result(this.resultScore, {Key? key}) : super(key: key);

  String get resultPhrase {
    if (this.resultScore <= 8) {
      return 'You are awesome and innocent!';
    } else if (this.resultScore <= 12) {
      return 'Pretty likeable!';
    } else if (this.resultScore <= 16) {
      return 'You are ... strange?!';
    }

    return 'You are so bad!';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        this.resultPhrase,
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
