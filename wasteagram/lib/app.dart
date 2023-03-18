import 'package:flutter/material.dart';
import 'screens/posts_list_screen.dart';
import 'screens/new_photo_screen.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  static final routes = {
    PostsListScreen.routeName: (context) => const PostsListScreen(),
    NewPhotoScreen.routeName: (context) => const NewPhotoScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Wasteagram",
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
      ),
      routes: routes,
    );
  }
}
