class Validators {
  static String required(String value) {
    return value.isEmpty ? "Field cannot be empty" : null;
  }

  static String Function(String) requiredWithMessage(String message) {
    return (String value) {
      return value.isEmpty ? message : null;
    };
  }

  static final _phoneNumberRegex = RegExp(
    r"^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$",
  );
  static String phoneNumber(String value) {
    if (!_phoneNumberRegex.hasMatch(value)) {
      return "Invalid Phone Number";
    }

    return null;
  }

  static final _emailRegex = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
  );
  static String email(String value) {
    if (!_emailRegex.hasMatch(value)) {
      return "Invalid Email Address";
    }

    return null;
  }
}
