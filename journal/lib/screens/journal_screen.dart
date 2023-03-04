import 'package:flutter/material.dart';
import '../models/journal.dart';
import '../models/journal_entry.dart';
import '../layouts/horizontal_layout.dart';
import '../layouts/vertical_layout.dart';
import '../widgets/journal_scaffold.dart';
import '../widgets/welcome.dart';
import '../app.dart';

class JournalScreen extends StatefulWidget {
  static const routeName = "/";

  const JournalScreen({Key? key}) : super(key: key);

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  late Journal journal;
  late JournalEntry currentEntry;

  @override
  void initState() {
    super.initState;
    currentEntry =
        JournalEntry(id: 0, title: "", body: "", rating: 0, date: "");
    loadJournal();
  }

  void updateEntryView(JournalEntry entry) {
    setState(() {
      currentEntry = entry;
    });
  }

  void loadJournal() async {
    // Replace with database GET
    AppState? appState = context.findAncestorStateOfType<AppState>();
    // Holds entries retrieved for database
    List<Map> databaseEntries = appState!.fakeData;
    // Creates JournalEntry for each database row and collects into list
    final journalEntries = databaseEntries.map((entry) {
      return JournalEntry(
        id: entry["id"],
        title: entry["title"],
        body: entry["body"],
        rating: entry["rating"],
        date: entry["date"],
      );
    }).toList();
    // Assigns list of JournalEntry to create Journal object
    setState(() {
      journal = Journal(entries: journalEntries);
      updateEntryView(journal.entries[0]);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (journal == null) {
      return const JournalScaffold(
        title: "Loading",
        child: Center(child: CircularProgressIndicator()),
      );
    } else {
      return JournalScaffold(
          title: journal.isEmpty ? "Welcome" : "Journal Entries",
          child: journal.isEmpty
              ? const Welcome()
              : LayoutBuilder(builder: journalViews));
    }
  }

  Widget journalViews(BuildContext context, BoxConstraints constraints) =>
      constraints.maxWidth < 800
          ? VerticalLayout(
              journal: journal,
              currentEntry: currentEntry,
              updateEntryView: updateEntryView)
          : HorizontalLayout(
              journal: journal,
              currentEntry: currentEntry,
              updateEntryView: updateEntryView,
            );
}
