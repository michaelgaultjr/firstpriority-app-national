import 'dart:async';
import 'package:first_priority_app/controllers/account.dart';
import 'package:first_priority_app/controllers/api.dart';
import 'package:first_priority_app/controllers/school.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  Future<void> initialize() async {
    await Get.putAsync(() => Api.createInstance());
    await Get.put(AccountController()).authenticate();
    Get.lazyPut(() => SchoolController(), fenix: true);
  }
}
