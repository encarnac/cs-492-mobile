import 'package:flutter/material.dart';
import 'journal_drawer.dart';
import '../screens/new_entry_screen.dart';

class JournalScaffold extends StatefulWidget {
  final String title;
  final Widget child;

  const JournalScaffold({Key? key, required this.title, required this.child})
      : super(key: key);

  @override
  State<JournalScaffold> createState() => _JournalScaffoldState();
}

class _JournalScaffoldState extends State<JournalScaffold> {
  @override
  Widget build(BuildContext context) {
    final floatingActionButton = widget.title == "New Journal Entry"
        ? null
        : FloatingActionButton(
            child: const Icon(Icons.add, size: 35.0),
            onPressed: () {
              navToNewJournalEntry(context);
            },
          );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.settings_rounded),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      endDrawer: const JournalDrawer(),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: SafeArea(child: widget.child),
    );
  }

  void navToNewJournalEntry(BuildContext context) {
    Navigator.of(context).pushNamed(NewEntryScreen.routeName);
  }
}
