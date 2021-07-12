import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:first_priority_app/controllers/api.dart';
import 'package:first_priority_app/controllers/school.dart';
import 'package:first_priority_app/models/authentication_result.dart';
import 'package:first_priority_app/models/user.dart';
import 'package:get/get.dart' as getx;

class AccountController extends getx.GetxController {
  final api = getx.Get.find<Api>();
  final _schoolController = getx.Get.find<SchoolController>();

  getx.Rx<User> get user => _user;
  getx.Rx<User> _user = getx.Rx<User>(null);

  Future<AuthenticationResult> login(String email, String password) async {
    final res = await api.client.post(
      '/api/account/login',
      data: FormData.fromMap({
        "email": email,
        "password": password,
      }),
    );

    return _handleAuthResult(res.data);
  }

  Future<void> logout() async {
    await api.client.get('/api/account/logout');
    _user.value = null;
    _schoolController.school.value = null;
  }

  Future<AuthenticationResult> authenticate() async {
    final res = await api.client.get('/api/account/authenticate');
    return _handleAuthResult(res.data);
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

  AuthenticationResult _handleAuthResult(dynamic data) {
    final result = AuthenticationResult.fromMap(data);

    if (result.authenticated) {
      _user(result.user);
      _schoolController.school(result.school);

      if (result.school != null)
        FirebaseMessaging.instance
            .subscribeToTopic("school_${result.school.id}");
      FirebaseMessaging.instance
          .subscribeToTopic("region_${result.user.regionId}");
      FirebaseMessaging.instance.subscribeToTopic("user_${result.user.id}");
    }

    return result;
  }
}
