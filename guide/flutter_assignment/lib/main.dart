import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first assignment'),
        ),
        body: Center(
          child: TextController(
            'foo',
            (text, cb) {
              print(
                  'called each time this button was pressed and on first render lul');
              return ButtonWithCustomText(
                text,
                cb,
              );
            },
          ),
        ),
      ),
    );
  }
}

class TextController extends StatefulWidget {
  final textCollection = [
    'foo',
    'bar',
    'baz',
  ];

  final String initialString;
  final Function renderChild;

  TextController(this.initialString, this.renderChild, {Key? key})
      : super(key: key);

  @override
  _TextControllerState createState() =>
      _TextControllerState(this.initialString);
}

class _TextControllerState extends State<TextController> {
  String text;

  _TextControllerState(initialString) : this.text = initialString;

  void _handleClick() {
    setState(() {
      this.text =
          widget.textCollection[Random().nextInt(widget.textCollection.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.renderChild(this.text, this._handleClick);
  }
}

class ButtonWithCustomText extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ButtonWithCustomText(this.text, this.onPressed, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.red,
      ),
      onPressed: this.onPressed,
      child: Text(this.text),
    );
  }
}
