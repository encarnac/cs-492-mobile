import 'package:flutter/material.dart';
import 'components/centered_placeholder.dart';

// MainScreen({Key? key, required this.title}) : super(key: key);
// TextTheme.headline5
class MainScreen extends StatelessWidget {
  final String title;

  const MainScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: CenteredPlaceholder(padding: 200),
    );
  }
}
