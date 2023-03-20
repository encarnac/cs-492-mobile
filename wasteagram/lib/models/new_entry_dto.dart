class NewEntryValues {
  // Intermediate data transfer object (DTO)
  late String date;
  late String imageURL;
  late int quantity;
  late double latitude;
  late double longitude;

  @override
  String toString() {
    return "Date: $date, Image URL: $imageURL, Quantity: $quantity, Latitude: $latitude, Longitude: $longitude";
  }
}
