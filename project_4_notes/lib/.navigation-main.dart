import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/alpha.dart';
import 'screens/beta.dart';
import 'screens/donut.dart';

void main() {
  runApp(const MainApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitUp,
  ]);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static final routes = {
    Alpha.routeName: (context) => const Alpha(),
    Beta.routeName: (context) => const Beta(),
    Donut.routeName: (context) => const Donut(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Journal",
      theme: ThemeData.dark(),
      routes: routes,
    );
  }
}
