import 'package:flutter/cupertino.dart';
import 'package:sembast/timestamp.dart';

class Notification {
  final String id;
  final String title;
  final String body;
  final Timestamp time;

  const Notification({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.time,
  });

  Notification.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        body = map['body'],
        time = map['time'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'time': time,
    };
  }
}
