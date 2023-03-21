import 'package:test/test.dart';
import 'package:wasteagram/models/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Timestamp data type

void main() {
  test("Post created with default constructor have correct values", () {
    final date = Timestamp(1679394429, 151438000);
    const imageURL = "https://picsum.photos/250?image=9";
    const quantity = 1;
    const latitude = -11.30859;
    const longitude = -33.90564;

    final newPost = Post(
      date: date,
      imageURL: imageURL,
      quantity: quantity,
      latitude: latitude,
      longitude: longitude,
    );

    expect(newPost.date, date);
    expect(newPost.imageURL, imageURL);
    expect(newPost.quantity, quantity);
    expect(newPost.latitude, latitude);
    expect(newPost.longitude, longitude);
  });

  test("Post created with late initialzers have correct values", () {
    final date = Timestamp(1679394429, 151438000);
    const imageURL = "https://picsum.photos/250?image=9";
    const quantity = 1;
    const latitude = -11.30859;
    const longitude = -33.90564;

    Post newPost = Post();
    newPost.date = date;
    newPost.imageURL = imageURL;
    newPost.quantity = quantity;
    newPost.latitude = latitude;
    newPost.longitude = longitude;

    expect(newPost.date, date);
    expect(newPost.imageURL, imageURL);
    expect(newPost.quantity, quantity);
    expect(newPost.latitude, latitude);
    expect(newPost.longitude, longitude);
  });

  test("Post values getter method returns correct Map key and values", () {
    final date = Timestamp(1679394429, 151438000);
    const imageURL = "https://picsum.photos/250?image=9";
    const quantity = 1;
    const latitude = -11.30859;
    const longitude = -33.90564;
    Map<String, dynamic> expectedPost = {
      "date": date,
      "imageURL": imageURL,
      "quantity": quantity,
      "latitude": latitude,
      "longitude": longitude,
    };

    final newPost = Post(
      date: date,
      imageURL: imageURL,
      quantity: quantity,
      latitude: latitude,
      longitude: longitude,
    );

    expect(newPost.values, expectedPost);
  });
}
