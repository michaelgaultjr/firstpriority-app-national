import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/middle_profile.dart';
import 'components/top_profile.dart';


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
