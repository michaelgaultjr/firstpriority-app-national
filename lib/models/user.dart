class User {
  final String id;
  final String name;
  String firstName;
  String lastName;
  final String regionId;
  final String email;
  String phoneNumber;
  final String church;
  final List<String> roles;

  // TODO: Clean this up
  final String schoolId;
  final String schoolName;
  final String schoolRoom;

  User.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        firstName = map['firstName'],
        lastName = map['lastName'],
        regionId = map['regionId'],
        email = map['email'],
        phoneNumber = map['phoneNumber'],
        church = map['church'],
        roles = List<String>.from(map['roles']),
        schoolId = map['schoolId'],
        schoolName = map['schoolName'],
        schoolRoom = map['schoolRoom'];

  bool hasRole(List<String> requiredRoles) {
    return requiredRoles.any((element) => roles.contains(element));
  }
}
