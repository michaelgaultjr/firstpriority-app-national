import 'package:flutter/widgets.dart';

class Meeting {
  final String id;
  final String school;
  final String cycle;
  final String room;
  final DateTime time;
  final String week;
  final Map<String, List<String>> roles;

  Meeting({
    @required this.week,
    @required this.school,
    @required this.room,
    this.cycle,
    this.id,
    this.time,
    this.roles,
  });

  Meeting.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        school = map['school'],
        cycle = map['cycle'],
        room = map['room'],
        time = DateTime.parse(map['time']),
        week = map['week'],
        roles = Map.from(map['roles']).map(
          (key, value) => MapEntry<String, List<String>>(
            key,
            List<String>.from(value),
          ),
        );
}
