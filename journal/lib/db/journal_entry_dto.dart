class JournalEntryFields {
  // Intermediate data transfer object (DTO)
  late String title;
  late String body;
  late int rating;
  late String date;

  @override
  String toString() {
    return "Title: $title, Body: $body, Rating: $rating, Date: $date";
  }
}
