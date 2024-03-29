import 'package:flutter/material.dart';
import 'components/app_tab_controller.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Call Me Maybe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Neue Haas',
      ),
      home: Scaffold(body: AppTabController()),
    );
  }
}
