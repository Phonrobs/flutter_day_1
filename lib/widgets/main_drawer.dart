import 'package:flutter/material.dart';
import 'package:test_app1/pages/account.dart';
import 'package:test_app1/pages/home.dart';
import 'package:test_app1/pages/settings.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text(
              'FoodPicker',
              style: TextStyle(fontSize: 30.0, color: Colors.blue),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) {
                  return HomePage();
                }),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) {
                  return SettingsPage();
                }),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Account'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) {
                  return AccountPage();
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}
