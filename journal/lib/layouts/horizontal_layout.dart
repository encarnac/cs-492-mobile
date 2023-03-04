import 'package:flutter/material.dart';
import '../models/journal.dart';
import '../models/journal_entry.dart';
import '../widgets/journal_entry_details.dart';

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
            contentPadding: const EdgeInsets.all(0.0),
            title: Text(journal.entries[index].title),
            subtitle: Text(journal.entries[index].date),
            onTap: () => updateEntryView(journal.entries[index]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(child: journalList(context)),
        Expanded(child: JournalEntryDetails(entry: currentEntry)),
      ],
    );
  }
}
