import 'package:flutter/cupertino.dart';

class Message {
  final String id;
  final String name;
  final String title;
  final String body;

  Message({
    @required this.id,
    @required this.name,
    this.title,
    this.body,
  });

  Message.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        title = map['title'],
        body = map['body'];
}
