import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/LogoImage.dart';
import 'components/bottom_signUp.dart';
import 'components/middle_sign_up.dart';
import 'components/top_sign_up.dart';

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
