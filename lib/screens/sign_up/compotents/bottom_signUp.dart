import 'package:first_priority_app/screens/sign_up/main_dashBoard/main_dashBoard.dart';
import 'package:first_priority_app/screens/sign_up/main_dashBoard/main_screen.dart';
import 'package:first_priority_app/screens/sign_up/signUp/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              value: this.valuefirst,
              onChanged: (bool value) {},
              checkColor: Colors.indigo,
              activeColor: Colors.blue,
            ),
            Text(
              'I agree with our ',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(width: 2.0),
            Text(
              'Terms',
              style: TextStyle(color: Colors.indigo),
            ),
            SizedBox(width: 2.0),
            Text(
              'and',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(width: 2.0),
            Text(
              'Conditions',
              style: TextStyle(color: Colors.indigo),
            ),
          ],
        )),
        SizedBox(
          height: 8,
        ),
        Container(
          margin: EdgeInsets.only(left: 20.0, right: 20.0),
          height: 40,
          child: Material(
            borderRadius: BorderRadius.circular(20.0),
            shadowColor: Colors.blue,
            color: Colors.indigo,
            elevation: 7.0,
            child: GestureDetector(
              onTap: () {
                _navigateToNextScreen(context);
              },
              child: Center(
                child: Text(
                  'Create account',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style:
                      TextStyle(color: Colors.grey, fontFamily: 'Montserrat'),
                ),
                SizedBox(
                  width: 5.0,
                ),
                InkWell(
                  onTap: () {
                    _navigateToNextScreen(context);
                  },
                  child: Text(
                    'SingIn',
                    style: TextStyle(
                        color: Colors.indigo,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold),
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
