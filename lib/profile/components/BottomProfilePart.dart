import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Constants.dart';

class BottomProfilePart extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  TextEditingController _schoolController = TextEditingController();
  TextEditingController _classController = TextEditingController();
  TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(startMargin, 20, startMargin, 0),
              child: TextFormField(
                controller: _emailController,
                initialValue: "mark.teney@gmail.com",
                keyboardType: TextInputType.emailAddress,
                style: profileTextStyle,
                decoration: profileTextDecoration,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(startMargin, 20, startMargin, 0),
              child: TextFormField(
                controller: _countryController,
                initialValue: "Lake County",
                keyboardType: TextInputType.text,
                style: profileTextStyle,
                decoration: profileTextDecoration,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(startMargin, 20, startMargin, 0),
              child: TextFormField(
                controller: _schoolController,
                initialValue: "Lake High School",
                keyboardType: TextInputType.text,
                style: profileTextStyle,
                decoration: profileTextDecoration,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(startMargin, 20, startMargin, 0),
              child: TextFormField(
                controller: _classController,
                initialValue: "Class of 2025",
                keyboardType: TextInputType.text,
                style: profileTextStyle,
                decoration: profileTextDecoration,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(startMargin, 20, startMargin, 0),
              child: TextFormField(
                controller: _cityController,
                initialValue: "City Church",
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
