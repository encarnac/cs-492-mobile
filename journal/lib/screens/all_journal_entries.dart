import 'package:flutter/material.dart';
import '../models/journal.dart';
import '../models/journal_entry.dart';
import '../widgets/journal_scaffold.dart';
import '../widgets/welcome.dart';
import '../app.dart';

class AllJournalEntries extends StatefulWidget {
  static const routeName = "/";

  const AllJournalEntries({Key? key}) : super(key: key);

  @override
  State<AllJournalEntries> createState() => _AllJournalEntriesState();
}

class _AllJournalEntriesState extends State<AllJournalEntries> {
  late Journal journal;

  @override
  void initState() {
    super.initState;
    loadJournal();
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
          child: journal.isEmpty ? const Welcome() : journalList(context));
    }
  }

  Widget journalList(BuildContext context) {
    return ListView.builder(
        itemCount: journal.entries.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(journal.entries[index].title),
              subtitle: Text(journal.entries[index].date),
              onTap: () => Navigator.of(context).pushNamed("/"));
        });
  }
}
