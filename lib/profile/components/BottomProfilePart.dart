import 'package:first_priority_app/controllers/account.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constants.dart';

class BottomProfilePart extends StatelessWidget {
  final AccountController _controller = Get.find<AccountController>();

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var countryController = TextEditingController(text: "Lake County");
  var schoolController = TextEditingController(text: "Lake High School");
  var churchController = TextEditingController();

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
