import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Tells Flutter to run the app defined in MyApp.
void main() {
  runApp(MyApp());
}

// The MyApp class extends StatelessWidget. Widgets are the elements from which you build every Flutter app.
// MyApp sets up the whole app. It creates the app-wide state (more on this later), names the app,
//defines the visual theme, and sets the "home" widget—the starting point of your app.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

// MyAppState class defines the app's...well...state.
// ChangeNotifier, which means that it can notify others about its own changes.
// The state is created and provided to the whole app using a ChangeNotifierProvider (see code above in MyApp).
//This allows any widget in the app to get hold of the state.
class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair
        .random(); // getNext() method reassigns current with a new random WordPair.
    notifyListeners(); //  Calls notifyListeners()(a method of ChangeNotifier)that ensures that anyone watching MyAppState is notified.
  }
}

// The Home widget set
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Every widget defines a build() method that's automatically called every time the widget's circumstances change so that the widget is always up to date.
    var appState = context.watch<
        MyAppState>(); // Tracks changes to the app's current state using the watch method.
    var pair = appState
        .current; // Make sure that the line being extracted only accesses what it needs

    return Scaffold(
      // Build methods must return a widget or (more typically) a nested tree of widgets. In this case, the top-level widget is Scaffold (commonly used)
      body: Column(
        // Column is one of the most basic layout widgets in Flutter. It takes any number of children and puts them in a column from top to bottom. By default, the column visually places its children at the top.
        children: [
          Text(
              'A random AWESOME idea:'), // You changed this Text widget in the first step.
          BigCard(
              pair:
                  pair), // This second Text widget takes appState, and accesses the only member of that class, current (which is a WordPair). WordPair provides several helpful getters, such as asPascalCase or asSnakeCase. Here, we use asLowerCase but you can change this now if you prefer one of the alternatives.
          ElevatedButton(
            onPressed: () {
              appState.getNext();
            },
            child: Text('Next'),
          ),
        ], // It is generally a good idea to use trailing commas: they make adding more members trivial, and they also serve as a hint for Dart's auto-formatter to put a newline there.
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    Key? key,
    required this.pair,
  }) : super(key: key);

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context); // Requests the app's current theme

    // By using theme.textTheme, you access the app's font theme.
    // displayMedium property is a large style meant for display text. use the ! operator ("bang operator") to assure Dart method is null-safe (always is).
    // Calling copyWith() on displayMedium returns a copy of the text style with the changes you define
    var style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
pair
    return Card(
      // Defines the card's color to be the same as the theme's colorScheme property.
      color: theme.colorScheme.primary, 
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(pair.asLowerCase, style: style),
      ),
    );
  }
}
