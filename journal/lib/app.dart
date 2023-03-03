import 'package:flutter/material.dart';
import 'screens/new_journal_entry.dart';
import 'screens/welcome.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static final routes = {
    Welcome.routeName: (context) => const Welcome(),
    NewJournalEntry.routeName: (context) => const NewJournalEntry(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      // home: const JournalScaffold(),
      routes: routes,
    );
  }
}
