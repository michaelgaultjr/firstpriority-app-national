import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../compotents/middle_sign_up.dart';
import '../compotents/top_sign_up.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          // decoration: gradientMainScreenBoxDecoration,
          child: Column(
            children: [TopSignUp(), Middle_signUp()],
          ),
        ),
      ),
    );
  }
}
