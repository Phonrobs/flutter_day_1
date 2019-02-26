import 'package:flutter/material.dart';
import 'package:test_app1/pages/home.dart';

void onSave() {
  print('Save');
}

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(),
        primaryColor: Colors.blue,
      ),
      home: HomePage(),
    )
  );
}
