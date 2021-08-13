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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.end,
        // mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // crossAxisAlignment: CrossAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.end,
        // crossAxisAlignment: CrossAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            color: Colors.blue,
            child: Text('CHART!'),
            elevation: 5,
          ),
          Card(
            color: Colors.red,
            child: Text('LIST OF TX'),
          ),
        ],
      ),
    );
  }
}
