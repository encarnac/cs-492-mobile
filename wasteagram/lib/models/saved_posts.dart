import 'post.dart';

class SavedPosts {
  List<Post> savedPosts;

  SavedPosts({this.savedPosts = const []});

  bool get isEmpty => savedPosts.isEmpty;

  int get total => savedPosts.length;
}
