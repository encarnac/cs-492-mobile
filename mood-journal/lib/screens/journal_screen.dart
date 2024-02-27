import 'package:flutter/material.dart';
import '../db/database_manager.dart';
import '../models/journal.dart';
import '../models/journal_entry.dart';
import '../layouts/horizontal_layout.dart';
import '../layouts/vertical_layout.dart';
import '../widgets/journal_scaffold.dart';
import '../widgets/welcome.dart';

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
    journal = Journal();
    currentEntry = JournalEntry();
    loadJournal();
  }

  void updateEntryView(JournalEntry entry) {
    setState(() {
      currentEntry = entry;
    });
  }

  void loadJournal() async {
    var databaseManager = DatabaseManager.getInstance();
    List<JournalEntry> journalEntries = await databaseManager.journalEntries();
    setState(() {
      journal = Journal(entries: journalEntries);
      if (!journal.isEmpty) {
        updateEntryView(journal.entries[0]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (journal.entries == []) {
      return const JournalScaffold(
        title: "Loading",
        child: Center(child: CircularProgressIndicator()),
      );
    } else {
      return JournalScaffold(
          title: journal.isEmpty ? "Journal" : "Journal Entries",
          child: journal.isEmpty ? const Welcome() : LayoutBuilder(builder: journalViews));
    }
  }

  Widget journalViews(BuildContext context, BoxConstraints constraints) => constraints.maxWidth < 800
      ? VerticalLayout(journal: journal, currentEntry: currentEntry, updateEntryView: updateEntryView)
      : HorizontalLayout(
          journal: journal,
          currentEntry: currentEntry,
          updateEntryView: updateEntryView,
        );
}
