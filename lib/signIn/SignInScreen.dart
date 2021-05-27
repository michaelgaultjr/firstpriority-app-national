import 'package:first_priority_app/signIn/components/BottomSignInPart.dart';
import 'package:first_priority_app/signIn/components/MiddleSignInPart.dart';
import 'package:first_priority_app/signIn/components/TopSignInPart.dart';
import 'package:flutter/material.dart';
import '../signUp/components/MiddleSignUpPart.dart';
import '../signUp/components/TopSignUpPart.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(32),
          child: Center(
            // decoration: gradientMainScreenBoxDecoration,
            child: Column(
              children: [
                TopSignInPart(),
                Expanded(
                  child: SingleChildScrollView(
                    child: MiddleSignInPart(),
                  ),
                ),
                BottomSignInPart()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
