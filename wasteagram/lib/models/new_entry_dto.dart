class NewEntryValues {
  // Intermediate data transfer object (DTO)
  late String date;
  late String photo;
  late int itemCount;
  late double latitude;
  late double longitude;

  @override
  String toString() {
    return "Date: $date, Photo: $photo, Item Count: $itemCount, Latitude: $latitude, Longitude: $longitude";
  }
}
