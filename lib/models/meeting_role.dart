class MeetingRole {
  final String role;
  final String name;

  MeetingRole.fromMap(Map<String, dynamic> map)
      : role = map['role'],
        name = map['name'];
}
