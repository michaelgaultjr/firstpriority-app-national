import 'package:first_priority_app/models/user.dart';

class AuthenticationResult {
  final bool authenticated;
  final bool requiresTwoFactor;
  final bool isLockedOut;
  final bool isNotAllowed;
  final User user;

  AuthenticationResult.fromMap(Map<String, dynamic> map)
      : authenticated = map['authenticated'],
        requiresTwoFactor = map['requiresTwoFactor'],
        isLockedOut = map['isLockedOut'],
        isNotAllowed = map['isNotAllowed'],
        user = map['user'] != null ? User.fromMap(map['user']) : null;
}
