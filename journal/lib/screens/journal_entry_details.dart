import 'package:flutter/material.dart';
import '../models/journal_entry.dart';

class JournalEntryDetails extends StatelessWidget {
  final JournalEntry entry;
  const JournalEntryDetails({Key? key, required this.entry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(entry.title),
        Text(entry.body),
      ],
    ));
  }
}
