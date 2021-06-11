import 'package:first_priority_app/controllers/account.dart';
import 'package:first_priority_app/controllers/api.dart';
import 'package:first_priority_app/models/user_profile.dart';
import 'package:get/get.dart' as getx;

class SchoolController extends getx.GetxController {
  final api = getx.Get.find<Api>();
  final _accountController = getx.Get.find<AccountController>();

  Future<List<UserProfile>> searchUsers(String query) async {
    final res = await api.client.get(
      '/api/schools/${_accountController.user.value.schoolId}/users',
      queryParameters: {
        'query': query,
      },
    );

    return List.from(res.data).map((e) => UserProfile.fromMap(e)).toList();
  }
}
