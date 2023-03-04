import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/new_entry_screen.dart';
import 'screens/journal_screen.dart';
import 'screens/details_screen.dart';
import 'db/database_manager.dart';

class App extends StatefulWidget {
  final SharedPreferences preferences;
  final DatabaseManager database;

  const App({super.key, required this.preferences, required this.database});

  @override
  State createState() => AppState();
}

class AppState extends State<App> {
  static final routes = {
    JournalScreen.routeName: (context) => const JournalScreen(),
    NewEntryScreen.routeName: (context) => const NewEntryScreen(),
  };

  bool get darkMode => widget.preferences.getBool("darkMode") ?? false;

  void updateDarkMode() {
    setState(() {
      widget.preferences.setBool("darkMode", !darkMode);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: darkMode ? Brightness.dark : Brightness.light,
        primarySwatch: Colors.teal,
      ),
      // home: const JournalScaffold(),
      routes: routes,
    );
  }
}
