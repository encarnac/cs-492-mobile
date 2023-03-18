
import 'dart:io';
import 'package:flutter/material.dart';
import '../layouts/app_scaffold.dart';

class PostsListScreen extends StatefulWidget {
  static const routeName = "/";

  const PostsListScreen({super.key});

  @override
  State<PostsListScreen> createState() => _PostsListScreenState();
}

class _PostsListScreenState extends State<PostsListScreen> {
  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
        title: "Wasteagram", buttonState: true, child: Text(""));
  }
}
