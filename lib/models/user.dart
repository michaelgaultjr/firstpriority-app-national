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

  User.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        firstName = map['firstName'],
        lastName = map['lastName'],
        regionId = map['regionId'],
        email = map['email'],
        phoneNumber = map['phoneNumber'],
        church = map['church'],
        roles = List<String>.from(map['roles']);

  bool hasRole(List<String> requiredRoles) {
    return requiredRoles.any((element) => roles.contains(element));
  }
}
