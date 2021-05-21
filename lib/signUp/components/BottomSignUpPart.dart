import 'package:first_priority_app/main_dashBoard/main_screen.dart';
import 'package:first_priority_app/signUp/controller/SignUpController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constants.dart';

class BottomSignUpPart extends StatelessWidget {
  final SignUpController _signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 24.0,
              width: 24.0,
              child: Obx(
                () => Checkbox(
                  value: _signUpController.isChecked.value,
                  onChanged: (bool value) {
                    _signUpController.isChecked.value = value;
                  },
                  checkColor: Colors.indigo,
                  activeColor: Colors.blue,
                ),
              ),
            ),
            Text(
              ' I agree with our ',
              style: getCustomTextProperties(
                  Colors.grey, 12, fontSchylerRegular, 0),
            ),
            SizedBox(width: 2.0),
            Text(
              'Terms',
              style: getCustomTextProperties(
                  colorDarkBlue1, 14, fontSchylerRegular, 1),
            ),
            SizedBox(width: 2.0),
            Text(
              'and',
              style: getCustomTextProperties(
                  Colors.grey, 12, fontSchylerRegular, 0),
            ),
            SizedBox(width: 2.0),
            Text(
              'Conditions',
              style: getCustomTextProperties(
                  colorDarkBlue1, 14, fontSchylerRegular, 1),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
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
                Get.to(MainScreen());
              },
              child: Center(
                child: Text(
                  'Create account',
                  style: getCustomTextProperties(
                      Colors.white, 16, fontSchylerRegular, 1),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20, top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account?',
                style: getCustomTextProperties(
                    Colors.grey, 12, fontSchylerRegular, 0),
              ),
              SizedBox(
                width: 2.0,
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'Sign In',
                  style: getCustomTextProperties(
                      colorDarkBlue1, 14, fontSchylerRegular, 1),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
