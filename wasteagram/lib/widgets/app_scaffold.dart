import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget title;
  final Widget body;
  final Widget? button;

  const AppScaffold(
      {Key? key, required this.title, required this.body, this.button})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(title: title),
          body: Center(child: body),
          floatingActionButton: button,
          resizeToAvoidBottomInset: false,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ));
  }
}
