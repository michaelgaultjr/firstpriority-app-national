import 'package:first_priority_app/dashboard/MainDashboard.dart';
import 'package:first_priority_app/signUp/controller/SignUpController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constants.dart';

class BottomSignInPart extends StatelessWidget {
  final SignUpController _signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 8),
          height: 40,
          child: Material(
            borderRadius: BorderRadius.circular(6.0),
            shadowColor: Colors.blue,
            color: colorDarkBlue1,
            elevation: 2.0,
            child: GestureDetector(
              onTap: () {
                Get.to(() => MainDashBoard());
              },
              child: Center(
                child: Text(
                  'Sign In',
                  style: getCustomTextProperties(
                      Colors.white, 16, fontSchylerRegular, 1),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Trouble signing in?',
              style: getCustomTextProperties(
                  Colors.grey, 12, fontSchylerRegular, 0),
            ),
            SizedBox(width: 2.0),
            Text(
              'Reset your password.',
              style: getCustomTextProperties(
                  colorDarkBlue1, 14, fontSchylerRegular, 1),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
