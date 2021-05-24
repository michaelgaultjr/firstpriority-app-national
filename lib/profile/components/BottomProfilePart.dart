import 'package:first_priority_app/profile/controller/ProfileController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constants.dart';

class BottomProfilePart extends StatelessWidget {
  final ProfileController _profileController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(startMargin, 20, startMargin, 0),
              child: TextFormField(
                controller: _profileController.emailController.value,
                keyboardType: TextInputType.emailAddress,
                style: profileTextStyle,
                decoration: profileTextDecoration,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(startMargin, 20, startMargin, 0),
              child: TextFormField(
                controller:_profileController.countryController.value,
                keyboardType: TextInputType.text,
                style: profileTextStyle,
                decoration: profileTextDecoration,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(startMargin, 20, startMargin, 0),
              child: TextFormField(
                controller: _profileController.schoolController.value,
                keyboardType: TextInputType.text,
                style: profileTextStyle,
                decoration: profileTextDecoration,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(startMargin, 20, startMargin, 0),
              child: TextFormField(
                controller: _profileController.classController.value,
                keyboardType: TextInputType.text,
                style: profileTextStyle,
                decoration: profileTextDecoration,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(startMargin, 20, startMargin, 0),
              child: TextFormField(
                controller: _profileController.cityController.value,
                keyboardType: TextInputType.text,
                style: profileTextStyle,
                decoration: profileTextDecoration,
              ),
            ),
            SizedBox(
              height: 90,
            ),
            Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0),
              height: 40,
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                shadowColor: Colors.blue,
                color: colorDarkBlue1,
                elevation: 3,
                child: GestureDetector(
                  onTap: () {},
                  child: Center(
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
