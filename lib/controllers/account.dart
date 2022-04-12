import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:first_priority_app/controllers/api.dart';
import 'package:first_priority_app/controllers/school.dart';
import 'package:first_priority_app/models/authentication_result.dart';
import 'package:first_priority_app/models/school.dart';
import 'package:first_priority_app/models/user.dart';
import 'package:first_priority_app/storage_manager.dart';
import 'package:get/get.dart' as getx;

class AccountController extends getx.GetxController {
  final api = getx.Get.find<Api>();
  final _schoolController = getx.Get.find<SchoolController>();

  getx.Rx<User> get user => _user;
  getx.Rx<User> _user = getx.Rx<User>(null);

  Future<AuthenticationResult> login(String email, String password) async {
    final schoolId = await StorageManager.read<String>("currentSchoolId");
    final res = await api.client.post(
      '/api/account/login',
      queryParameters: {
        'schoolId': schoolId,
      },
      data: FormData.fromMap({
        "email": email,
        "password": password,
      }),
    );

    return await _handleAuthResult(res.data);
  }

  Future<void> logout() async {
    await api.client.get('/api/account/logout');

    FirebaseMessaging.instance
      ..unsubscribeFromTopic("region_${_user.value.regionId}")
      ..unsubscribeFromTopic("user_${_user.value.id}");

    _user.value = null;

    await _schoolController.setSchool(null);
  }

  Future<AuthenticationResult> authenticate() async {
    final schoolId = await StorageManager.read<String>("currentSchoolId");
    final res = await api.client.get(
      '/api/account/authenticate',
      queryParameters: {
        'schoolId': schoolId,
      },
    );
    return await _handleAuthResult(res.data);
  }

  Future<User> updateDetails({
    String firstName,
    String lastName,
    String phoneNumber,
  }) async {
    await api.client.post('/api/account', data: {
      "phoneNumber": phoneNumber,
    });

    _user.update((usr) {
      usr.firstName = firstName;
      usr.lastName = lastName;
      usr.phoneNumber = phoneNumber;
      return usr;
    });

    return _user.value;
  }

  Future roleConfirmation({
    ConfirmationRole role,
    School school,
    DateTime graduationYear,
  }) async {
    await api.client.post('/api/account/confirm-role', data: {
      "role": role.index,
      "schoolId": school?.id,
      "graduationYear": graduationYear,
    });

    _user.update((usr) {
      if (graduationYear != null) usr.graduationYear = graduationYear;
      usr.isRoleConfirmed = true;
      return usr;
    });

    _schoolController.setSchool(school);
    return _user.value;
  }

  Future<AuthenticationResult> _handleAuthResult(dynamic data) async {
    final result = AuthenticationResult.fromMap(data);

    if (result.authenticated) {
      _user(result.user);
      await _schoolController.setSchool(result.school);

      FirebaseMessaging.instance
        ..subscribeToTopic("region_${result.user.regionId}")
        ..subscribeToTopic("user_${result.user.id}");
    }

    return result;
  }
}
