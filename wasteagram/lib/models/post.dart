class Post {
  late String date;
  late String imageURL;
  late int quantity;
  late double latitude;
  late double longitude;

  Post({
    this.date = '',
    this.imageURL = '',
    this.quantity = 0,
    this.latitude = 0,
    this.longitude = 0,
  });

  @override
  String toString() {
    return "Date: $date, Image URL: $imageURL, Quantity: $quantity, Latitude: $latitude, Longitude: $longitude";
  }
}
