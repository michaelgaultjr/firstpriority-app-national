import 'dart:async';
import 'package:first_priority_app/signUp/SignUpScreen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  Timer _timer;

  @override
  void onInit() {
    super.onInit();
    _timer = Timer(
      Duration(milliseconds: 5000),
      () {
        Get.off(SignUpScreen());
      },
    );
  }
}
