import 'package:flutter/material.dart';
import 'screens/new_entry_screen.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  static final routes = {
    NewEntryScreen.routeName: (context) => const NewEntryScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Wasteagram",
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
      ),
      routes: routes,
    );
  }
}
