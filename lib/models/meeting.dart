import 'package:first_priority_app/models/user_profile.dart';
import 'package:flutter/widgets.dart';

class Meeting {
  final String id;
  final String school;
  final String cycle;
  final String room;
  final DateTime time;
  final String week;
  final String videoUrl;
  final String pdfUrl;
  final Map<String, List<UserProfile>> roles;

  Meeting({
    @required this.week,
    @required this.school,
    @required this.room,
    this.videoUrl,
    this.pdfUrl,
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
        videoUrl = map['videoUrl'],
        pdfUrl = map['pdfUrl'],
        roles = Map.from(map['roles']).map(
          (key, value) => MapEntry<String, List<UserProfile>>(
            key,
            List.from(value).map((e) => UserProfile.fromMap(e)).toList(),
          ),
        );
}
