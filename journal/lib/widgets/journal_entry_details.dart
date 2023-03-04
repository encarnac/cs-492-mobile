import 'package:flutter/material.dart';
import '../models/journal_entry.dart';

class JournalEntryDetails extends StatelessWidget {
  final JournalEntry entry;
  const JournalEntryDetails({Key? key, required this.entry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.topStart,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              entry.title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(entry.date, style: Theme.of(context).textTheme.titleMedium),
            Text("Rating: ${entry.rating.toString()}/4",
                style: Theme.of(context).textTheme.titleMedium),
            Divider(),
            Text(entry.body),
          ],
        ),
      ),
    );
  }
}
