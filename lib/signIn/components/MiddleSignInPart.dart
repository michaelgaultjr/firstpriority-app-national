import 'package:first_priority_app/signUp/subComponents/DropDownSelectSchool.dart';
import 'package:flutter/material.dart';
import '../../Constants.dart';

class MiddleSignInPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.text,
          style: TextStyle(
            fontFamily: fontSchylerRegular,
          ),
          decoration: inputEditTextDecoration.copyWith(
              labelText: "Username or Email",
              labelStyle: labelStyleTextFormField,
              hintText: "Enter Username or Email",
              hintStyle: hintStyleTextFormField),
        ),
        TextFormField(
          keyboardType: TextInputType.visiblePassword,
          style: TextStyle(fontFamily: fontSchylerRegular),
          obscureText: true,
          decoration: inputEditTextDecoration.copyWith(
              labelText: "Password",
              labelStyle: labelStyleTextFormField,
              hintText: "Enter Password",
              hintStyle: hintStyleTextFormField),
        ),
      ],
    );
  }
}
