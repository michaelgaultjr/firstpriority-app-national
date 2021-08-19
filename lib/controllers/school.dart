import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:first_priority_app/controllers/api.dart';
import 'package:first_priority_app/models/school.dart';
import 'package:first_priority_app/models/user_profile.dart';
import 'package:first_priority_app/storage_manager.dart';
import 'package:get/get.dart' as getx;

class SchoolController extends getx.GetxController {
  final api = getx.Get.find<Api>();

  getx.Rx<School> get school => _school;
  getx.Rx<School> _school = getx.Rx<School>(null);

  Future<List<UserProfile>> searchUsers(String query) async {
    final res = await api.client.get(
      '/api/schools/${_school.value.id}/users',
      queryParameters: {
        'query': query,
      },
    );

    return List.from(res.data).map((e) => UserProfile.fromMap(e)).toList();
  }

  Future<List<School>> getSchools() async {
    final res = await api.client.get('/api/schools/details');

    return List.from(res.data).map((e) => School.fromMap(e)).toList();
  }

  Future<void> setSchool(School newSchool) async {
    // Return if they're both null, as there's no reason run any of the code below.
    if (_school.value == null && newSchool == null) return;

    if (newSchool == null) {
      FirebaseMessaging.instance
          .unsubscribeFromTopic("school_${_school.value.id}");

      _school(null);
      // The function above doesn't let you set null as a value
      // so it causes problems with the school selection screen
      _school.value = null;

      await StorageManager.delete("currentSchoolId");
    } else {
      _school(newSchool);
      FirebaseMessaging.instance.subscribeToTopic("school_${_school.value.id}");
      await StorageManager.save("currentSchoolId", _school.value.id);
    }
  }
}
