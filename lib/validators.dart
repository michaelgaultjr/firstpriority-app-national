class Validators {
  static String required(String value) {
    return value.isEmpty ? "Field cannot be blank" : null;
  }

  static final _phoneNumberRegex =
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$');
  static String phoneNumber(String value) {
    if (!_phoneNumberRegex.hasMatch(value)) {
      return 'Invalid Phone Number Format.';
    }

    return null;
  }
}
