import 'package:first_priority_app/controllers/api.dart';
import 'package:first_priority_app/models/school.dart';
import 'package:first_priority_app/models/user_profile.dart';
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
}
