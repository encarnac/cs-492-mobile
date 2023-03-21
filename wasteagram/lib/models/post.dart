import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  late Timestamp? date;
  late String? imageURL;
  late int quantity;
  late double latitude;
  late double longitude;

  Post({
    this.date,
    this.imageURL,
    this.quantity = 0,
    this.latitude = 0,
    this.longitude = 0,
  });

  @override
  String toString() {
    return "Date: ${date!.toString()}, Image URL: $imageURL, Quantity: $quantity, Latitude: $latitude, Longitude: $longitude";
  }

  Map<String, dynamic> savePost() {
    return {
      "date": date,
      "imageURL": imageURL,
      "quantity": quantity,
      "latitude": latitude,
      "longitude": longitude
    };
  }
}
