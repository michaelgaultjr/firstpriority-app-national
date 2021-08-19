import 'package:flutter/material.dart';

class MeetingRole {
  final String name;
  final int order;

  MeetingRole({
    @required this.name,
    @required this.order,
  });

  static Map<String, MeetingRole> roles = {
    'greeters': MeetingRole(name: "Greeters", order: 0),
    'prayer': MeetingRole(name: "Prayer", order: 1),
    'game_coordinators': MeetingRole(name: "Game Coordinators", order: 2),
    'promotions': MeetingRole(name: "Promotions", order: 3),
    'audio_visual': MeetingRole(name: "Audio Visual", order: 4),
    'food_order': MeetingRole(name: "Food Order", order: 5),
    'discussion_leaders': MeetingRole(name: "Discussion Leaders", order: 6),
    'setup_teardown': MeetingRole(name: "Setup & Teardown", order: 7),
    'reporting': MeetingRole(name: "Reporting", order: 8)
  };
}
