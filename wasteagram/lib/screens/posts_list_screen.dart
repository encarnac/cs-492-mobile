import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
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
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: wasteagramTitle(context),
        button: FloatingActionButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(NewPostScreen.routeName),
            child: const Icon(Icons.photo_camera, size: 35.0)),
        body: postsList(context));
  }

  Widget wasteagramTitle(BuildContext context) {
    String? totalWaste;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("posts")
            .orderBy("date", descending: true)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            num total = 0;
            snapshot.data!.docs.forEach((doc) {
              total += doc['quantity'];
            });
            totalWaste = total.toString();
            return Text("Wasteagram - ${totalWaste!}");
          } else {
            return const Text("Wasteagram");
          }
        });
  }

  Widget postsList(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("posts")
            .orderBy("date", descending: true)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
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
                  title: Text(DateFormat.yMMMEd().format(post.date!.toDate()),
                      style: Theme.of(context).textTheme.titleMedium),
                  trailing: Text(post.quantity.toString(),
                      style: Theme.of(context).textTheme.titleLarge),
                  onTap: () {
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
