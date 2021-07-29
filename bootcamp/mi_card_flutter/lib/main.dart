import 'package:flutter/material.dart';

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
          // child: Container(
          //   height: 100.0,
          //   width: 100.0,
          //   // margin: EdgeInsets.all(20.0),
          //   // margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 10.0),
          //   // margin: EdgeInsets.fromLTRB(30.0, 10.0, 50.0, 20.0),
          //   // margin: EdgeInsets.only(left: 30.0),
          //   // padding: EdgeInsets.all(20.0),
          //   color: Colors.white,
          //   child: Text('Hello'),
          // ),
          child: Row(
            // mainAxisSize: MainAxisSize.min,
            // verticalDirection: VerticalDirection.up,
            // verticalDirection: VerticalDirection.down, // default
            // mainAxisAlignment: MainAxisAlignment.start, // default
            // mainAxisAlignment: MainAxisAlignment.end,
            // mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start, //default
            // crossAxisAlignment: CrossAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 100.0,
                // width: 100.0,
                // width: double.infinity,
                width: 30.0,
                color: Colors.white,
                child: Text('Container 1'),
              ),
              SizedBox(
                // height: 20.0,
                width: 20.0,
              ),
              Container(
                // width: 100.0,
                // width: 300.0, // test with CrossAxisAlignment.end
                // width: double.infinity,
                height: 100.0,
                color: Colors.blue,
                child: Text('Container 2'),
              ),
              Container(
                // width: 100.0,
                // width: double.infinity,
                height: 100.0,
                color: Colors.red,
                child: Text('Container 3'),
              ),
              // Container(
              //   width: double.infinity,
              //   height: 10.0,
              //   color: Colors.black,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
