import "package:flutter/material.dart";

class JournalEntriesScreen extends StatelessWidget {
  static const routeKey = "journal_entries";

  // Generates sample lits of faux data
  final items = List<Map>.generate(1000, (i) {
    return {
      "title": "Journal Entry $i",
      "subtitle": "Subtitle text for $i",
    };
  });

  @override
  Widget build(BuildContext context) {
    return JournalScaffold(
      title: "Journal Entries",
      // Include itemCount to itemBuilder if known
      // Use index to obtain data to pass to ListView child
      child: ListView.builder(itemBuilder: (context, index) {
        // TIP: Use ListTile as the primary child widget, not rows
        return ListTile(
            leading: const FlutterLogo(),
            trailing: const Icon(Icons.more_horiz),
            title: Text("Journal Entry ${items[index]["title"]}"),
            subtitle: Text("Example ${items[index]["subtitle"]}"),
            onTap: () => Navigator.of(context).pushNamed("/"));
      }),
    );
  }
}
