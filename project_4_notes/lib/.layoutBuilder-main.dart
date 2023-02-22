import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Adaptive Layouts",
      theme: ThemeData(primarySwatch: Colors.brown),
      home: Scaffold(
        appBar: AppBar(title: const Text("Adaptive Layouts")),
        body: LayoutBuilder(builder: layoutDecider),
        // Container(constraints: BoxConstraints(
        //       maxWidth: 400, maxHeight: 300, minWidth: 400, minHeight: 300),
        // child: LayoutBuilder(builder: layoutDecider),),
      ),
    );
  }

  Widget layoutDecider(BuildContext context, BoxConstraints constraints) =>
      constraints.maxWidth < 500
          ? const VerticalLayout()
          : const HorizontalLayout();
}

class VerticalLayout extends StatelessWidget {
  const VerticalLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.amberAccent);
  }
}

class HorizontalLayout extends StatelessWidget {
  const HorizontalLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(child: Container(color: Colors.amber)),
        Expanded(child: Container(color: Colors.lightGreen))
      ],
    );
  }
}
