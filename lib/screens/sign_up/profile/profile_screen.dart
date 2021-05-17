import 'package:first_priority_app/screens/sign_up/profile/components/middle_profile.dart';
import 'package:first_priority_app/screens/sign_up/profile/components/top_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          // decoration: gradientMainScreenBoxDecoration,
          child: Column(
            children: [TopProfile(), MiddleProfile()],
          ),
        ),
      ),
    );
  }
}
