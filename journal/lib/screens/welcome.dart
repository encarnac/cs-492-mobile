import 'package:flutter/material.dart';
import '../widgets/journal_scaffold.dart';

class Welcome extends StatelessWidget {
  static const routeName = "/";

  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return JournalScaffold(
      title: "Welcome",
      child: Center(
        child: Icon(
          Icons.menu_book_rounded,
          color: Theme.of(context).colorScheme.secondary,
          size: 100.0,
        ),
      ),
    );
  }
}
