import 'package:flutter/material.dart';
import '../widgets/journal_scaffold.dart';
import '../widgets/journal_entry_form.dart';

class NewEntryScreen extends StatelessWidget {
  static const routeName = "new-entry";

  const NewEntryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const JournalScaffold(
      title: "New Journal Entry",
      child: JournalEntryForm(),
    );
  }
}
