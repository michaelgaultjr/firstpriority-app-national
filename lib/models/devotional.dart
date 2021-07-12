class Devotional {
  final String title;
  final String description;
  final String imageUrl;
  final String videoUrl;
  final String planUrl;
  final DateTime startDate;
  final DateTime endDate;

  Devotional.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        description = map['description'],
        imageUrl = map['imageUrl'],
        videoUrl = map['videoUrl'],
        planUrl = map['planUrl'],
        startDate = DateTime.parse(map['startDate']),
        endDate = DateTime.parse(map['endDate']);

  Devotional({
    this.title,
    this.description,
    this.imageUrl,
    this.videoUrl,
    this.planUrl,
    this.startDate,
    this.endDate,
  });
}
