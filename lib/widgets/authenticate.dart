import 'package:first_priority_app/controllers/account.dart';
import 'package:first_priority_app/dashboard/MainDashboard.dart';
import 'package:first_priority_app/login/login_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Authenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<AccountController>(
      builder: (controller) {
        if (controller.user.value == null) {
          return LoginScreen();
        }

        return MainDashBoard();
      },
    );
  }
}
