class Devotional {
  final String title;
  final String description;
  final String contentUrl;
  final String planUrl;
  final DateTime startDate;
  final DateTime endDate;

  Devotional.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        description = map['description'],
        contentUrl = map['contentUrl'],
        planUrl = map['planUrl'],
        startDate = DateTime.parse(map['startDate']),
        endDate = DateTime.parse(map['endDate']);
}
