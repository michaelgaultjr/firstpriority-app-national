import 'package:first_priority_app/controllers/account.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopProfilePart extends StatelessWidget {
  final AccountController _controller = Get.find<AccountController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          margin: EdgeInsets.only(top: 10.0),
          child: Text(
            _controller.user.value.name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
      ),
    );
  }
}
