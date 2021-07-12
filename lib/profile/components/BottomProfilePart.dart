import 'package:first_priority_app/controllers/account.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constants.dart';

class BottomProfilePart extends StatelessWidget {
  final AccountController _controller = Get.find<AccountController>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final countryController = TextEditingController(text: "Lake County");
  final schoolController = TextEditingController(text: "Lake High School");
  final churchController = TextEditingController();

  BottomProfilePart() {
    firstNameController.text = _controller.user.value.firstName;
    lastNameController.text = _controller.user.value.lastName;
    churchController.text = _controller.user.value.church;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(startMargin, 20, startMargin, 0),
              child: TextFormField(
                controller: firstNameController,
                keyboardType: TextInputType.name,
                style: profileTextStyle,
                decoration:
                    profileTextDecoration.copyWith(hintText: "First Name"),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(startMargin, 20, startMargin, 0),
              child: TextFormField(
                controller: lastNameController,
                keyboardType: TextInputType.name,
                style: profileTextStyle,
                decoration:
                    profileTextDecoration.copyWith(hintText: "Last Name"),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(startMargin, 20, startMargin, 0),
              child: TextFormField(
                controller: countryController,
                keyboardType: TextInputType.text,
                style: profileTextStyle,
                decoration: profileTextDecoration.copyWith(hintText: "Region"),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(startMargin, 20, startMargin, 0),
              child: TextFormField(
                controller: schoolController,
                keyboardType: TextInputType.text,
                style: profileTextStyle,
                decoration: profileTextDecoration.copyWith(hintText: "School"),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(startMargin, 20, startMargin, 0),
              child: TextFormField(
                controller: churchController,
                keyboardType: TextInputType.text,
                style: profileTextStyle,
                decoration: profileTextDecoration.copyWith(hintText: "Church"),
              ),
            ),
            SizedBox(
              height: 90,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Edit Profile'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
