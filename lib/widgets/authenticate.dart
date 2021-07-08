import 'package:first_priority_app/controllers/account.dart';
import 'package:first_priority_app/controllers/school.dart';
import 'package:first_priority_app/dashboard/MainDashboard.dart';
import 'package:first_priority_app/login/login_screen.dart';
import 'package:first_priority_app/schools/schools_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Authenticate extends StatelessWidget {
  final AccountController _accountController = Get.find<AccountController>();
  final SchoolController _schoolController = Get.find<SchoolController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_accountController.user.value == null) {
        return LoginScreen();
      }

      if (_schoolController.school.value == null) {
        return SchoolsScreen();
      }

      return MainDashBoard();
    });
  }
}
