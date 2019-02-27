import 'package:flutter/material.dart';
import 'package:test_app1/pages/home.dart';

void onSave() {
  print('Save');
}

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        primarySwatch: Colors.orange,
        buttonColor: Colors.orange,
    ),
    home: HomePage(),
  ));
}
