import 'package:flutter/material.dart';
import 'package:test_app1/widgets/hello.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.lightBlue[800],
      accentColor: Colors.cyan[600],
      textTheme: TextTheme(
        body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        button:
            TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.white),
      ),
    ),
    home: Scaffold(
        appBar: AppBar(
          title: Text('My Todo'),
        ),
        body: HelloWidget()),
  ));
}
