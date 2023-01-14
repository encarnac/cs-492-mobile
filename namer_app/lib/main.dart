import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Function: main
///   Tells Flutter to run the app defined in MyApp.
void main() {
  runApp(MyApp());
}

/// Widget: MyApp
/// StatelessWidget - creates the app-wide state, names the app, defines the visual theme,
/// and sets the "home" widget—the starting point of your app.
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
          colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 149, 162, 236)),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

/// Class: MyAppState
/// ChangeNotifier - Defines the app's state. Notifies others about its changes.
///   The state is created and provided to the whole app by extending ChangeNotifierProvider
///   (see code above in MyApp). This allows any widget in the app to get hold of the state.
class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    // Reassigns current with a new random WordPair.
    current = WordPair.random();

    // Notifies MyAppState listeners of a change
    notifyListeners();
  }
}

/// Widget: MyHomePage
///   Contains the layout structure consisting of nested widgets
class MyHomePage extends StatelessWidget {
  // Rebuilds widget everytime dependencies change
  @override
  Widget build(BuildContext context) {
    // Tracks changes to the app state (MyAppState)
    var appState = context.watch<MyAppState>();

    // Extracts only the attribute needed from class (current word pair)
    var pair = appState.current;

    // Build methods must return a widget (Scaffold - top-level structure)
    return Scaffold(
      // Style widget to group child widgets in middle of horizontal axis
      body: Center(
        // Column - basic layout widget, takes multiple children and displays them vertically
        child: Column(
          // Centers child widgets in middle of vertical axis
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            // 1st child - styled container widget holding current WordPair
            BigCard(pair: pair),

            // 2nd child - Empty style widget to create visual gap
            SizedBox(height: 10),

            // 3rd child - Button widget that calls the getNext() function for new random WordPair
            ElevatedButton(
              onPressed: () {
                appState.getNext();
              },
              child: Text('Next'),
              // Trailing commas for easy append and for Dart's auto newline
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget: BigCard
///   Extracted from MyHomePage's Scaffold Widget (Refractor>Extract Widget)
class BigCard extends StatelessWidget {
  const BigCard({
    Key? key,
    required this.pair,
  }) : super(key: key);

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    // Requests the app's current theme
    var theme = Theme.of(context);

    // Save a copy of the theme's font styles and change its color
    var style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    // Uses Composition instead of Inheritance by using Padding widgets (Refractor>Padding)
    return Card(
      // Styles the card using the theme's colorScheme property
      color: theme.colorScheme.primary,

      // Sets the size of the card shadow
      elevation: 4,

      // Contains styled WordPair text and padding
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          pair.asLowerCase,
          style: style,
          semanticsLabel: pair.asPascalCase,
        ),
      ),
    );
  }
}
