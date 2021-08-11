import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  const Result(this.resultScore, this.resetHandler, {Key? key})
      : super(key: key);

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
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            this.resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: this.resetHandler,
            child: Text(
              'Restart Quiz!',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          )
        ],
      ),
    );
  }
}
