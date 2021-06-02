import 'dart:async';
import 'package:first_priority_app/controllers/account.dart';
import 'package:first_priority_app/controllers/api.dart';
import 'package:first_priority_app/widgets/authenticate.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    load().then((value) => Get.off(() => Authenticate()));
  }

  Future<void> load() async {
    await Get.putAsync(() => Api.createInstance());
    await Get.put(AccountController()).authenticate();
  }
}
