import 'package:flutter/material.dart';
import 'package:flutterapp512/ui/welcome_screen.dart';
import 'package:flutterapp512/ui/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "玩安卓",
      theme: ThemeData(accentColor: Colors.red),
      home: WelcomeScreen(),
    );
  }
}
