import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';
import '../models/post.dart';
import '../widgets/app_scaffold.dart';

class PostDetailsScreen extends StatelessWidget {
  /// Named route
  static const routeName = "post-details";

  /// The post containing the details to display
  final Post? post;

  const PostDetailsScreen({super.key, this.post});

  //// Creates basic layout of the screen
  @override
  Widget build(BuildContext context) {
    // Creates basic layout of the screen
    return AppScaffold(
      title: const Text("Wasteagram"),
      body: postDetails(context, post!),
    );
  }

  /// Displays the properties of the selected Post
  Widget postDetails(BuildContext context, Post post) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.width * .04,
        horizontal: MediaQuery.of(context).size.height * .04,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          /// Date
          Text(DateFormat.yMMMMEEEEd().format(post.date!.toDate()),
              style: Theme.of(context).textTheme.headlineSmall),

          /// Image
          FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: post.imageURL!,
            height: MediaQuery.of(context).size.height * .5,
          ),

          /// Quantity
          Text("${post.quantity.toString()} items",
              style: Theme.of(context).textTheme.headlineSmall),

          /// Location (latitude, longitude)
          Text("Location(${post.latitude}, ${post.longitude})")
        ],
      ),
    );
  }
}
