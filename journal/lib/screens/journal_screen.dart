import 'package:flutter/material.dart';
import '../models/journal.dart';
import '../models/journal_entry.dart';
import '../widgets/journal_entry_details.dart';
import '../widgets/journal_scaffold.dart';
import '../widgets/welcome.dart';
import '../app.dart';
import 'details_screen.dart';

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

  Widget journalList(BuildContext context) {
    return ListView.builder(
        itemCount: journal.entries.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(journal.entries[index].title),
              subtitle: Text(journal.entries[index].date),
              onTap: () => setState(() {
                    currentEntry = journal.entries[index];
                  }));
        });
  }
}

class VerticalLayout extends StatelessWidget {
  final Journal journal;
  final JournalEntry currentEntry;
  final void Function(JournalEntry entry) updateEntryView;

  const VerticalLayout({
    Key? key,
    required this.journal,
    required this.currentEntry,
    required this.updateEntryView,
  }) : super(key: key);

  Widget journalList(BuildContext context) {
    return ListView.builder(
        itemCount: journal.entries.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(journal.entries[index].title),
            subtitle: Text(journal.entries[index].date),
            onTap: () {
              updateEntryView(journal.entries[index]);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailsScreen(journalEntry: journal.entries[index]),
                ),
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: journalList(context));
  }
}

class HorizontalLayout extends StatelessWidget {
  final Journal journal;
  final JournalEntry currentEntry;
  final void Function(JournalEntry entry) updateEntryView;

  const HorizontalLayout({
    Key? key,
    required this.journal,
    required this.currentEntry,
    required this.updateEntryView,
  }) : super(key: key);

  Widget journalList(BuildContext context) {
    return ListView.builder(
        itemCount: journal.entries.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(journal.entries[index].title),
            subtitle: Text(journal.entries[index].date),
            onTap: () => updateEntryView(journal.entries[index]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(child: Container(child: journalList(context))),
        Expanded(
          child: JournalEntryDetails(entry: currentEntry),
        ),
      ],
    );
  }
}
