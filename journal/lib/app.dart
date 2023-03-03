import 'package:flutter/material.dart';
import 'screens/new_journal_entry.dart';
import 'screens/welcome.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State createState() => AppState();
}

class AppState extends State<App> {
  static final routes = {
    Welcome.routeName: (context) => const Welcome(),
    NewJournalEntry.routeName: (context) => const NewJournalEntry(),
  };

  late bool darkMode; // DONE: Lifted state up.

  @override
  void initState() {
    super.initState();
    darkMode = false;
  }

  void updateDarkMode() {
    setState(() {
      darkMode = !darkMode;
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
