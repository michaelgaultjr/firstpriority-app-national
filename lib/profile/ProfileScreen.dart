import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/BottomProfilePart.dart';
import 'components/TopProfilePart.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          // decoration: gradientMainScreenBoxDecoration,
          child: Column(
            children: [
              TopProfilePart(),
              BottomProfilePart(),
            ],
          ),
        ),
      ),
    );
  }
}
