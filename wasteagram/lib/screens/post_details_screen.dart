import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../widgets/app_scaffold.dart';
import '../models/post.dart';

class PostDetailsScreen extends StatelessWidget {
  static const routeName = "post-details";
  final Post? post;
  // final Post post = Post(
  //     date: "Mar 18, 2023",
  //     imageURL: "assets/Photo1.jpg",
  //     quantity: 4,
  //     latitude: 37.111111,
  //     longitude: -122.406417);

  const PostDetailsScreen({super.key, this.post});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: post!.date,
        body: postDetails(context, post!),
        button: const SizedBox(width: 0.0));
  }

  Widget postDetails(BuildContext context, Post post) {
    File image = File(post.imageURL);
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getHeightOf(context),
        horizontal: getWidthOf(context),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.file(image),
          const SizedBox(height: 5),
          Text(post.quantity.toString(),
              style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 15),
          Text("Location(${post.latitude}, ${post.longitude})")
        ],
      ),
    );
  }

  double getWidthOf(context) {
    return MediaQuery.of(context).size.width * .04;
  }

  double getHeightOf(context) {
    return MediaQuery.of(context).size.height * .04;
  }
}
