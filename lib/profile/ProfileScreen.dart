import 'package:first_priority_app/profile/controller/ProfileController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/BottomProfilePart.dart';
import 'components/TopProfilePart.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController _profileController = Get.put(ProfileController());
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
