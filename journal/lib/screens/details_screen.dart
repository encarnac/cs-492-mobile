import 'package:flutter/material.dart';
import '../models/journal_entry.dart';
import '../widgets/journal_entry_details.dart';
import '../widgets/journal_scaffold.dart';

class DetailsScreen extends StatelessWidget {
  static const routeName = "entry-details";
  // Declare a field that holds the journalEntry.
  final JournalEntry journalEntry;

  // In the constructor, require a JournalEntry.
  const DetailsScreen({super.key, required this.journalEntry});

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return JournalScaffold(
      title: journalEntry.date,
      child: Container(
          padding: EdgeInsets.all(20.0),
          child: JournalEntryDetails(entry: journalEntry)),
    );
  }
}
