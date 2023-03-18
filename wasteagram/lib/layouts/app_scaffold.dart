import 'package:flutter/material.dart';
import '../screens/new_photo_screen.dart';

class AppScaffold extends StatefulWidget {
  final String title;
  final Widget child;
  final bool buttonState;

  const AppScaffold(
      {Key? key,
      required this.title,
      required this.child,
      required this.buttonState})
      : super(key: key);

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: SafeArea(child: widget.child),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: widget.buttonState
            ? FloatingActionButton.large(
                onPressed: () =>
                    Navigator.of(context).pushNamed(NewPhotoScreen.routeName),
                child: const Icon(Icons.add_a_photo),
              )
            : null);
  }
}
