import 'package:first_priority_app/screens/sign_up/signUp/compotents/LogoImage.dart';
import 'package:first_priority_app/screens/sign_up/signUp/compotents/middle_sign_up.dart';
import 'package:first_priority_app/screens/sign_up/signUp/compotents/top_sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(32),
          child: Center(
            // decoration: gradientMainScreenBoxDecoration,
            child: Column(
              children: [LogoImage(),TopSignUp(), Middle_signUp()],
            ),
          ),
        ),
      ),
    );
  }
}
