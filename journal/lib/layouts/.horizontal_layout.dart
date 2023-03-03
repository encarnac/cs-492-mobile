import 'package:flutter/material.dart';

class HorizontalLayout extends StatelessWidget {
  final Widget journalList;

  const HorizontalLayout({Key? key, required this.journalList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(child: Container(child: journalList)),
        Expanded(child: Container(color: Colors.blue))
      ],
    );
  }
}
