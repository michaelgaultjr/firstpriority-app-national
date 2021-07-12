class UserProfile {
  final String id;
  final String role;
  final String name;

  UserProfile.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        role = map['role'],
        name = map['name'];
}
