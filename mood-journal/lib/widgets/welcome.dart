import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.menu_book_rounded,
        color: Theme.of(context).colorScheme.secondary,
        size: 100.0,
      ),
    );
  }
}
