import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mi_card/components/info_box.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/images/ninetails.png'),
              ),
              Text(
                'Carlos Kazuo',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Frontend Developer'.toUpperCase(),
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 14.0,
                  letterSpacing: 2.5,
                  color: Colors.teal.shade100,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              InfoBox(
                icon: Icon(
                  Icons.phone,
                  color: Colors.teal.shade900,
                ),
                content: '+55 (99) 99999 9999',
                color: Colors.teal.shade900,
              ),
              InfoBox(
                icon: FaIcon(
                  FontAwesomeIcons.twitter,
                  color: Colors.teal.shade900,
                ),
                content: 'ninetails',
                color: Colors.teal.shade900,
              ),
              InfoBox(
                icon: FaIcon(
                  FontAwesomeIcons.linkedin,
                  color: Colors.teal.shade900,
                ),
                content: 'ninetails',
                color: Colors.teal.shade900,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
