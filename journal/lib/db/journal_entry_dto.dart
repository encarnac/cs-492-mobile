class JournalEntryFields {
  // Intermediate data transfer object (DTO)
  late String title;
  late String body;
  late DateTime dateTime;
  late int rating;

  @override
  String toString() {
    return "Title: $title, Body: $body, Date: $dateTime, Rating: $rating";
  }
}
