import 'package:flutter/material.dart';
import '../models/journal.dart';
import '../models/journal_entry.dart';
import '../screens/details_screen.dart';

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
