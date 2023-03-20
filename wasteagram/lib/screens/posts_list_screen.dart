import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
import '../models/post.dart';
import '../widgets/app_scaffold.dart';
import 'new_post_screen.dart';
import 'post_details_screen.dart';

class PostsListScreen extends StatefulWidget {
  static const routeName = "/";

  const PostsListScreen({Key? key}) : super(key: key);

  @override
  State<PostsListScreen> createState() => _PostsListScreenState();
}

class _PostsListScreenState extends State<PostsListScreen> {
  // List<Post>? posts;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: "Wasteagram",
        button: FloatingActionButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(NewPostScreen.routeName),
            child: const Icon(Icons.photo_camera, size: 35.0)),
        body: postsList(context));
  }

  Widget postsList(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final postData = snapshot.data!.docs[index];
                final post = Post(
                  date: postData["date"],
                  imageURL: postData["imageURL"],
                  quantity: postData["quantity"],
                  latitude: postData["latitude"],
                  longitude: postData["longitude"],
                );
                return ListTile(
                  title: Text(post.date),
                  trailing: Text(post.quantity.toString(),
                      style: Theme.of(context).textTheme.titleLarge),
                  onTap: () {
                    // updateEntryView(posts[index]);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostDetailsScreen(post: post),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
