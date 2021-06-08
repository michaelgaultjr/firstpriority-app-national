import 'package:first_priority_app/models/meeting_role.dart';
import 'package:flutter/cupertino.dart';

class Meeting {
  final String id;
  final String school;
  final String cycle;
  final String room;
  final DateTime time;
  final String week;
  final List<MeetingRole> roles;

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
        roles =
            List.from(map['roles']).map((e) => MeetingRole.fromMap(e)).toList();
}
