enum ConfirmationRole {
  student,
  studentLeader,
  teacherSponsor,
  mentor,
}

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
  bool isRoleConfirmed;
  DateTime graduationYear;

  User.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        firstName = map['firstName'],
        lastName = map['lastName'],
        regionId = map['regionId'],
        email = map['email'],
        phoneNumber = map['phoneNumber'],
        church = map['church'],
        isRoleConfirmed = map['isRoleConfirmed'],
        graduationYear = map['graduationYear'] == null
            ? null
            : DateTime.parse(map['graduationYear']),
        roles = List<String>.from(map['roles']);

  bool hasRole(String requiredRole) {
    return roles.contains(requiredRole);
  }

  bool hasRoles(List<String> requiredRoles) {
    return requiredRoles.any((element) => roles.contains(element));
  }
}
