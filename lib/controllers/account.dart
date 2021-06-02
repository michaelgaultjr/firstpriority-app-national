import 'package:dio/dio.dart';
import 'package:first_priority_app/controllers/api.dart';
import 'package:first_priority_app/models/authentication_result.dart';
import 'package:first_priority_app/models/user.dart';
import 'package:get/get.dart' as getx;

class AccountController extends getx.GetxController {
  final api = getx.Get.find<Api>();

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

  Future<AuthenticationResult> authenticate() async {
    final res = await api.client.get('/api/account/authenticate');
    return _handleAuthResult(res.data);
  }

  AuthenticationResult _handleAuthResult(dynamic data) {
    final result = AuthenticationResult.fromMap(data);

    if (result.authenticated) {
      _user(result.user);
    }
    return result;
  }
}
