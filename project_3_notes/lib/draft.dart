import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(child: MyWidget()),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onHorizontalDragStart: (details) {
          print('Drag Started $details');
        },
        onHorizontalDragEnd: (details) {
          print('Drag Ended $details');
        },
        child: Text('Hello, World!',
            style: Theme.of(context).textTheme.headline4));
  }
}
