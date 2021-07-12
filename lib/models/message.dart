import 'package:flutter/cupertino.dart';

class Message {
  final String id;
  final String name;

  Message({@required this.id, @required this.name});

  Message.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'];
}
