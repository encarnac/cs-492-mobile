import 'package:flutter/material.dart';
import 'components/app_tab_controller.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Call Me Maybe',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Scaffold(body: AppTabController()),
    );
  }
}
