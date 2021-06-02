import 'package:dio/dio.dart';
import 'package:first_priority_app/controllers/core_api.dart';
import 'package:first_priority_app/models/user.dart';
import 'package:get/get.dart' as getx;

class AccountController extends getx.GetxController {
  getx.Rx<User> get user => _user;
  getx.Rx<User> _user;

  Future<User> login(String email, String password) async {
    final api = getx.Get.find<COREApi>();
    final res = await api.post(
      '/api/account/login',
      data: FormData.fromMap({
        "email": email,
        "password": password,
      }),
    );
    _user = User.fromMap(res.data).obs;
    return _user.value;
  }
}
