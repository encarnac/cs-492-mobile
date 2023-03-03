import 'package:flutter/material.dart';
import '../models/journal.dart';

Widget journalList(BuildContext context, Journal journal) {
  return ListView.builder(
      itemCount: journal.entries.length,
      itemBuilder: (context, index) {
        return ListTile(
            title: Text(journal.entries[index].title),
            subtitle: Text(journal.entries[index].date),
            onTap: () => Navigator.of(context).pushNamed("/"));
      });
}
