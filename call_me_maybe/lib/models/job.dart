class Job {
  final String title;
  final String company;
  final String dates;
  final String location;
  final String description;

  Job(this.title, this.company, this.dates, this.location, this.description);

  factory Job.fromJson(Map json) {
    return Job(
      json["title"] as String,
      json["company"],
      json["dates"],
      json["location"],
      json["description"],
    );
  }
}
