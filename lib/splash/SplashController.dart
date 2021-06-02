import 'dart:async';
import 'package:first_priority_app/signIn/SignInScreen.dart';
import 'package:first_priority_app/widgets/authenticate.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  Timer _timer;

  @override
  void onInit() {
    super.onInit();
    _timer = Timer(
      Duration(milliseconds: 1000),
      () {
        Get.off(Authenticate());
      },
    );
  }
}
