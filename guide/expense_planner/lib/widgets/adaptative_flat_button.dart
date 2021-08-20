import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeFlatButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const AdaptativeFlatButton(
      {required this.child, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: this.child,
            onPressed: this.onPressed,
          )
        : TextButton(
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all(
                TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            onPressed: this.onPressed,
            child: this.child,
          );
  }
}
