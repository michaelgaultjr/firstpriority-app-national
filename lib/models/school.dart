import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class School {
  final String id;
  final String name;
  final String room;
  final bool allowDelivery;
  final TimeOfDay meetTime;
  final Color primary;
  final Color secondary;

  School.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        room = map['room'],
        allowDelivery = map['allowDelivery'],
        meetTime = TimeOfDay(
          hour: map['meetTime']['hours'],
          minute: map['meetTime']['minutes'],
        ),
        primary = map['primaryColorHex'] != null
            ? HexColor(map['primaryColorHex'])
            : Colors.red,
        secondary = map['secondaryColorHex'] != null
            ? HexColor(map['secondaryColorHex'])
            : Colors.blue;
}
