import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function onPressed;

  Answer(this.onPressed, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
        ),
        child: Text('Answer 1'),
        onPressed: this.onPressed,
      ),
    );
  }
}
