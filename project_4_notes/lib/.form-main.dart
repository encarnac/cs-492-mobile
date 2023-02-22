import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/journal_entry_form.dart';

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
      title: "Adaptive Layouts",
      theme: ThemeData(primarySwatch: Colors.teal),
      home: Scaffold(
        appBar: AppBar(title: const Text("Adaptive Layouts")),
        body: JournalEntryForm(),
      ),
    );
  }
}
