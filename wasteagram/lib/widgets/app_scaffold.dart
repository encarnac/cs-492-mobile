import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget title;
  final Widget body;
  final Widget? faButton;
  final Widget? bottomNavButton;

  const AppScaffold({
    Key? key,
    required this.title,
    required this.body,
    this.faButton,
    this.bottomNavButton,
  }) : super(key: key);

  /// Displays reusable scaffold shared between different screens
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(title: title),
          body: Center(child: body),
          resizeToAvoidBottomInset: false,
          floatingActionButton: faButton,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: bottomNavButton,
        ));
  }
}
