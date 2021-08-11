import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  Answer(this.onPressed, this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.orange,
          onPrimary: Colors.white,
        ),
        // style: ButtonStyle(
        //   backgroundColor: MaterialStateProperty.all(Colors.blue),
        // ),
        child: Text(this.text),
        onPressed: this.onPressed,
      ),
    );
  }
}
