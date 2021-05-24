import 'package:flutter/material.dart';
import 'components/BottomSignUpPart.dart';
import 'components/MiddleSignUpPart.dart';
import 'components/TopSignUpPart.dart';

class SignUpScreen extends StatelessWidget {
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
                TopSignUpPart(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Column(
                        children: [
                          MiddleSignUpPart(),
                          BottomSignUpPart(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
