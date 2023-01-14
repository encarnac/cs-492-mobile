import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Function: main
///   Tells Flutter to run the app defined in MyApp.
void main() {
  runApp(MyApp());
}

/// Widget: MyApp
/// StatelessWidget - creates the app-wide state, names the app,
///   defines the visual theme, and sets the "home" widget—the starting
///   point of your app.
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

/// Class: MyAppState
/// ChangeNotifier - Defines the app's state. Notifies others about its changes.
///   The state is created and provided to the whole app using a ChangeNotifierProvider
///   (see code above in MyApp). This allows any widget in the app to get hold of the state.
class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    // getNext() method reassigns current with a new random WordPair.
    current = WordPair.random();

    // Notifies MyAppState listeners of a change
    notifyListeners();
  }
}

/// Widget: MyHomePage
///
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Tracks changes to MyAppState to rebuild the widget
    var appState = context.watch<MyAppState>();

    // Extracts only the value needed (current word pair)
    var pair = appState.current;

    // Returns the Scaffold widget (the basic Material visual layout structure)
    return Scaffold(
      // Column widget takes any number of children and displays them vertically.
      body: Column(
        children: [
          // First child is a Text widget (a run of text with a single style)
          Text('A random AWESOME idea:'),
          // Second child is a reference to an imported widget containing the current word pair
          BigCard(pair: pair),
          // Third child is a button widget that calls the getNext() function to change current word
          ElevatedButton(
            onPressed: () {
              appState.getNext();
            },
            child: Text('Next'),
            // Add trailing commas for easy append and for Dart's auto newline
          ),
        ],
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

    return Card(
      // Defines the card's color to be the same as the theme's colorScheme property.
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(pair.asLowerCase,
            style:
                style), // This second Text widget takes appState, and accesses the only member of that class, current (which is a WordPair). WordPair provides several helpful getters, such as asPascalCase or asSnakeCase. Here, we use asLowerCase but you can change this now if you prefer one of the alternatives
      ),
    );
  }
}
