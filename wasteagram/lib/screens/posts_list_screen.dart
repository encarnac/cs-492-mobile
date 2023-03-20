import 'package:flutter/material.dart';
import '../models/post.dart';
import '../widgets/app_scaffold.dart';
import 'new_post_screen.dart';
import 'post_details_screen.dart';

const allPosts = [
  {
    "date": "Saturday, March 18, 2023",
    "imageURL": "https://picsum.photos/250?image=9",
    "quantity": 4,
    "latitude": 37.111111,
    "longitude": -122.406417
  },
  {
    "date": "Saturday, March 18, 2023",
    "imageURL": "https://picsum.photos/250?image=9",
    "quantity": 4,
    "latitude": 37.111111,
    "longitude": -122.406417
  },
  {
    "date": "Saturday, March 18, 2023",
    "imageURL": "https://picsum.photos/250?image=9",
    "quantity": 4,
    "latitude": 37.111111,
    "longitude": -122.406417
  },
  {
    "date": "Saturday, March 18, 2023",
    "imageURL": "https://picsum.photos/250?image=9",
    "quantity": 4,
    "latitude": 37.111111,
    "longitude": -122.406417
  },
];

class PostsListScreen extends StatefulWidget {
  static const routeName = "/";

  const PostsListScreen({super.key});

  @override
  State<PostsListScreen> createState() => _PostsListScreenState();
}

class _PostsListScreenState extends State<PostsListScreen> {
  List<Post>? posts;

  void initState() {
    super.initState;
    posts = getData();
    setState(() {});
  }

  List<Post> getData() {
    return List.generate(allPosts.length, (i) {
      return Post(
          date: "Saturday, March 18, 2023",
          imageURL: "https://picsum.photos/250?image=9",
          quantity: 4,
          latitude: 37.111111,
          longitude: -122.406417);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: "Wasteagram",
        button: FloatingActionButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(NewPostScreen.routeName),
            child: const Icon(Icons.photo_camera, size: 35.0)),
        body: postsList(context, posts));
  }

  Widget postsList(BuildContext context, dynamic posts) {
    if (posts == null) {
      return const CircularProgressIndicator();
    } else {
      return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(posts[index].date),
              trailing: Text(posts[index].quantity.toString(),
                  style: Theme.of(context).textTheme.titleLarge),
              onTap: () {
                // updateEntryView(posts[index]);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostDetailsScreen(post: posts[index]),
                  ),
                );
              },
            );
          });
    }
  }
}
