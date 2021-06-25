class Validators {
  static String required(String value) {
    return value.isEmpty ? "Field cannot be blank" : null;
  }
}
