import 'package:flutter/material.dart';
import 'counter.dart';

void main() => runApp(MyApp());

/// The main root widget that defines rules and settings for the rest of its children
///
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterWidget(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  // Creates special State object to contain the state of counter object
  @override
  CounterState createState() {
    return CounterState();
  }
}

/// Creates State object for CounterWidget
///
class CounterState extends State<CounterWidget> {
  final Counter counter = Counter(0);

  void incrementCounter() {
    setState(() {
      counter.increment();
    });
  }
rrr
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter App')),
      body: Center(
        child: Colum
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello World'),
            Text(
              counter.value.toString(),
              style: TextStyle(fontSize: 72),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add)),
    );
  }
}

// MainScreen({Key? key, required this.title}) : super(key: , kk);
// TextTheme.headline5
() { functionCall(param)} 
