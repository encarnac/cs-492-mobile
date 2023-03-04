import 'journal_entry.dart';

class Journal {
  List<JournalEntry> entries;

  Journal({this.entries = const []});

  bool get isEmpty => entries.isEmpty;
}
