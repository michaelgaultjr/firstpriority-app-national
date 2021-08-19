import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  static Future<void> save(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is int) {
      prefs.setInt(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else if (value == null) {
      prefs.remove(key);
    } else {
      print("Invalid Type");
    }
  }

  static Future<bool> hasKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

  static Future<T> read<T>(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.get(key) as T;
  }

  static Future<bool> delete(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}
