import 'package:flutter/material.dart';

class AppScaffold extends StatefulWidget {
  final String title;
  final Widget child;

  const AppScaffold({Key? key, required this.title, required this.child})
      : super(key: key);

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(child: widget.child),
    );
  }
}
