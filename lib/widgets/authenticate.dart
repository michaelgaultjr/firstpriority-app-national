import 'package:first_priority_app/controllers/account.dart';
import 'package:first_priority_app/dashboard/MainDashboard.dart';
import 'package:first_priority_app/signIn/SignInScreen.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Authenticate extends StatelessWidget {
  final AccountController _controller = Get.find<AccountController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_controller.user.value == null) {
        return SignInScreen();
      }

      return MainDashBoard();
    });
  }
}
