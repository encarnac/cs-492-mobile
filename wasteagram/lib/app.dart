import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'screens/new_post_screen.dart';
import 'screens/post_details_screen.dart';
import 'screens/posts_list_screen.dart';

class App extends StatefulWidget {
  static Future<void> reportError(dynamic error, dynamic stackTrace) async {
    final sentryId =
        await Sentry.captureException(error, stackTrace: stackTrace);
    sentryId.toString();
  }

  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  static final routes = {
    PostsListScreen.routeName: (context) => const PostsListScreen(),
    NewPostScreen.routeName: (context) => const NewPostScreen(),
    PostDetailsScreen.routeName: (context) => const PostDetailsScreen(),
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
