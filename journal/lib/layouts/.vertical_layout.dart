import 'package:flutter/material.dart';

class VerticalLayout extends StatelessWidget {
  final Widget journalList;

  const VerticalLayout({Key? key, required this.journalList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: journalList);
  }
}
