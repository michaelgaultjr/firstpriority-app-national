import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class School {
  final String id;
  final String name;
  final String room;
  final Color primary;
  final Color secondary;

  School.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        room = map['room'],
        primary = map['primaryColorHex'] != null
            ? HexColor(map['primaryColorHex'])
            : Colors.red,
        secondary = map['secondaryColorHex'] != null
            ? HexColor(map['secondaryColorHex'])
            : Colors.blue;
}
