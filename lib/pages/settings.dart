import 'package:flutter/material.dart';
import 'package:test_app1/widgets/main_drawer.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Settings'),
      ),
    );
  }
}