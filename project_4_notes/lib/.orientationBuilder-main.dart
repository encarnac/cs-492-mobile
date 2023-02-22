import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Adaptive Layouts",
      theme: ThemeData(primarySwatch: Colors.brown),
      home: Scaffold(
        appBar: AppBar(title: const Text("Adaptive Layouts")),
        body: const AdaptiveWidget(),
      ),
    );
  }
}

class AdaptiveWidget extends StatelessWidget {
  const AdaptiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.purple,
        alignment: const AlignmentDirectional(0.0, 0.0),
        constraints: const BoxConstraints(
          maxHeight: 300.0,
          maxWidth: 500.0,
          minWidth: 300.0,
          minHeight: 200.0,
        ),
        // child: MediaQuery.of(context).orientation == Orientation.portrait ? whiteSquare() : blackSquare()
        child: OrientationBuilder(
          builder: (context, orientation) {
            return orientation == Orientation.portrait
                ? whiteSquare()
                : blackSquare();
          },
        ),
      ),
    );
  }

  Widget whiteSquare() {
    return Container(
      color: Colors.white,
      constraints: const BoxConstraints(
        maxHeight: 50.0,
        maxWidth: 50.0,
        minWidth: 50.0,
        minHeight: 50.0,
      ),
    );
  }

  Widget blackSquare() {
    return Container(
      color: Colors.black,
      constraints: const BoxConstraints(
        maxHeight: 50.0,
        maxWidth: 50.0,
        minWidth: 50.0,
        minHeight: 50.0,
      ),
    );
  }
}
