import 'package:flutter/material.dart';
import '../layouts/app_scaffold.dart';
import 'new_post_screen.dart';

class PostsListScreen extends StatefulWidget {
  static const routeName = "/";

  const PostsListScreen({super.key});

  @override
  State<PostsListScreen> createState() => _PostsListScreenState();
}

class _PostsListScreenState extends State<PostsListScreen> {
  List<Map>? data;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: "Wasteagram",
        button: FloatingActionButton.large(
            onPressed: () =>
                Navigator.of(context).pushNamed(NewPostScreen.routeName),
            child: const Icon(Icons.add_a_photo)),
        body: const CircularProgressIndicator());
  }
}
