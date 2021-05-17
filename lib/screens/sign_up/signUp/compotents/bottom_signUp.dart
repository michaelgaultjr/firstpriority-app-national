import 'package:first_priority_app/screens/sign_up/main_dashBoard/main_dashBoard.dart';
import 'package:first_priority_app/screens/sign_up/main_dashBoard/main_screen.dart';
import 'package:first_priority_app/screens/sign_up/signUp/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Constants.dart';

class Bootom_SignUp extends StatelessWidget {
  bool valuefirst = false;
  bool valuesecond = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 24.0,
              width: 24.0,
              child: Checkbox(
                value: this.valuefirst,
                onChanged: (bool value) {},
                checkColor: Colors.indigo,
                activeColor: Colors.blue,
              ),
            ),
            Text(
              ' I agree with our ',
              style: getCustomTextProperties(Colors.grey, 12, "Schyler", 0),
            ),
            SizedBox(width: 2.0),
            Text(
              'Terms',
              style: getCustomTextProperties(colorDarkBlue1, 14, "Schyler", 1),
            ),
            SizedBox(width: 2.0),
            Text(
              'and',
              style: getCustomTextProperties(Colors.grey, 12, "Schyler", 0),
            ),
            SizedBox(width: 2.0),
            Text(
              'Conditions',
              style: getCustomTextProperties(colorDarkBlue1, 14, "Schyler", 1),
            ),
          ],
        )),
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
                _navigateToNextScreen(context);
              },
              child: Center(
                child: Text(
                  'Create account',
                  style:
                      getCustomTextProperties(Colors.white, 16, "Schyler", 1),
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
                  style: getCustomTextProperties(Colors.grey, 12, "Schyler", 0),
                ),
                SizedBox(
                  width: 5.0,
                ),
                InkWell(
                  onTap: () {
                    _navigateToNextScreen(context);
                  },
                  child: Text(
                    'Sign In',
                    style: getCustomTextProperties(
                        colorDarkBlue1, 14, "Schyler", 1),
                  ),
                ),
              ],
            ))
      ],
    ));
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MainScreen()));
  }
}
