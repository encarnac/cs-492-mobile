import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/journal_entries.dart';

void main() {
  runApp(const MainApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitUp,
  ]);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Journal Entries",
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: const Text("Journal Entries")),
        body: JournalEntriesScreen(),
      ),
    );
  }
}
