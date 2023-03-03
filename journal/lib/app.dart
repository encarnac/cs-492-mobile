import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/new_journal_entry.dart';
import 'screens/welcome.dart';

class App extends StatefulWidget {
  final SharedPreferences preferences;

  const App({super.key, required this.preferences});

  @override
  State createState() => AppState();
}

class AppState extends State<App> {
  static final routes = {
    Welcome.routeName: (context) => const Welcome(),
    NewJournalEntry.routeName: (context) => const NewJournalEntry(),
  };

  bool get darkMode => widget.preferences.getBool("darkMode") ?? false;

  void updateDarkMode() {
    setState(() {
      widget.preferences.setBool("darkMode", !darkMode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: darkMode ? Brightness.dark : Brightness.light,
      ),
      // home: const JournalScaffold(),
      routes: routes,
    );
  }
}
