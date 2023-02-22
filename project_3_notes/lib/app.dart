import 'package:flutter/material.dart';
import 'main_screen.dart';

/// The main root widget that defines rules and settings for the rest of its children
///
class App extends StatelessWidget {
  final String title;

  const App({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(title: title),
    );
  }
}
