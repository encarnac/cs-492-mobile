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
  // Stores the current WordPair
  var current = WordPair.random();

  // Reassigns current with a new random WordPair and notifies listeners
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  // Stores a list of saved WordPairs
  var favorites = <WordPair>[];

  // Removes existing WordPair from list or adds it if new, then notifies listeners
  void toggleFavorite(value) {
    if (favorites.contains(value)) {
      favorites.remove(value);
    } else {
      favorites.add(value);
    }
    notifyListeners();
  }
}

/// Widget: MyHomePage
///   Contains the navigation sidebar for the Home and Favorites pages
///   Stateful because it only tracks state relevant to it (selectedIndex)
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Stores the current navigation tab (0 = first destination listed in NavigationRail)
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Create page widget and assigns screen content based on selectedIndex
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = FavoritesPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    // Build methods must return a widget (Scaffold - top-level layout widget)
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            // Child 1 - SafeArea ensures that its child (NavigationRail) is not obscured by system UI
            SafeArea(
              child: NavigationRail(
                // Sets label visibility next to icons
                extended: constraints.maxWidth >= 500,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text('Favorites'),
                  ),
                ],

                // The current navigation tab selected
                selectedIndex: selectedIndex,

                // Defines what happens when destination icon selected
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),

            // Child 2 - Expanded widgets set children greedy for available axis space
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}

/// Widget: GeneratorPage
///   Contains the layout structure consisting of nested widgets
class GeneratorPage extends StatelessWidget {
  // Rebuilds widget everytime dependencies change
  @override
  Widget build(BuildContext context) {
    // Tracks changes to the app state (MyAppState)
    var appState = context.watch<MyAppState>();

    // Extracts only the attribute needed from class (current word pair)
    var pair = appState.current;

    // Sets icon based on if WordPair is in list
    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    // Style widget to group child widgets in middle of horizontal axis
    return Center(
      // Column - basic layout widget, takes multiple children and displays them vertically
      child: Column(
        // Centers child widgets in middle of vertical axis
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          // 1st child - styled container widget holding current WordPair
          BigCard(pair: pair),

          // 2nd child - Empty style widget to create visual gap
          SizedBox(height: 10),

          // 3rd child - a row of buttons
          Row(
            // Sets row to not take up all available horizontal space
            mainAxisSize: MainAxisSize.min,
            children: [
              // Button calls toggleFavorite() to add/remove WordPair from list
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite(pair);
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),

              SizedBox(width: 10.0),

              // Button calls the getNext() function for new random WordPair
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
                // Trailing commas for easy append and for Dart's auto newline
              ),
            ],
          ),
        ],
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


/// Page Widget: FavoritesPage
///   
class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${appState.favorites.length} favorites:'),
        ),
        for (var pair in appState.favorites)
          ListTile(
            // leading: Icon(Icons.favorite),
            leading: IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {
                  appState.toggleFavorite(pair);
                }),
            title: Text(pair.asLowerCase),
          ),
      ],
    );
  }
}
