class User {
  final String name;
  final String firstName;
  final String lastName;
  final String regionId;
  final String email;
  final String phoneNumber;
  final String church;
  final List<String> roles;
  final String schoolId;
  final String schoolName;

  User.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        firstName = map['firstName'],
        lastName = map['lastName'],
        regionId = map['regionId'],
        email = map['email'],
        phoneNumber = map['phoneNumber'],
        church = map['church'],
        roles = List<String>.from(map['roles']),
        schoolId = map['schoolId'],
        schoolName = map['schoolName'];
}
