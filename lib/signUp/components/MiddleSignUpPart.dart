import 'package:first_priority_app/signUp/subComponents/DropDownSelectSchool.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Constants.dart';
import 'BottomSignUpPart.dart';

class MiddleSignUpPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.text,
          style: TextStyle(
            fontFamily: fontKarlaRegular,
          ),
          decoration: inputEditTextDecoration.copyWith(
              labelText: "Name",
              labelStyle: labelStyleTextFormField,
              hintText: "Enter Name",
              hintStyle: hintStyleTextFormField),
        ),
        TextFormField(
          keyboardType: TextInputType.text,
          style: TextStyle(fontFamily: fontKarlaRegular),
          decoration: inputEditTextDecoration.copyWith(
              labelText: "Email",
              labelStyle: labelStyleTextFormField,
              hintText: "Enter Email",
              hintStyle: hintStyleTextFormField),
        ),
        TextFormField(
          style: TextStyle(fontFamily: fontKarlaRegular),
          decoration: inputEditTextDecoration.copyWith(
              labelText: "Password",
              labelStyle: labelStyleTextFormField,
              hintStyle: hintStyleTextFormField,
              hintText: "Enter Password"),
          obscureText: true,
          keyboardType: TextInputType.text,
          obscuringCharacter: '*',
        ),
        TextFormField(
          keyboardType: TextInputType.text,
          style: TextStyle(fontFamily: fontKarlaRegular),
          decoration: inputEditTextDecoration.copyWith(
              labelText: "Country",
              labelStyle: labelStyleTextFormField,
              hintStyle: hintStyleTextFormField,
              hintText: "Enter Country"),
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(top: topMarginStart),
          child: Text(
            'School',
            style:
                getCustomTextProperties(Colors.grey, 16, fontSchylerRegular, 0),
          ),
        ),
        DropDownSelectSchool(),
        TextFormField(
          keyboardType: TextInputType.text,
          style: TextStyle(fontFamily: fontKarlaRegular),
          decoration: inputEditTextDecoration.copyWith(
              labelText: "Role",
              labelStyle: labelStyleTextFormField,
              hintStyle: hintStyleTextFormField,
              hintText: "Enter Role"),
        ),
        TextFormField(
          keyboardType: TextInputType.text,
          style: TextStyle(fontFamily: fontKarlaRegular),
          decoration: inputEditTextDecoration.copyWith(
              labelText: "Graduating Class",
              labelStyle: labelStyleTextFormField,
              hintStyle: hintStyleTextFormField,
              hintText: "Enter Graduating Class"),
        ),
        TextFormField(
          keyboardType: TextInputType.text,
          style: TextStyle(fontFamily: fontKarlaRegular),
          decoration: inputEditTextDecoration.copyWith(
              labelText: "Church Name",
              labelStyle: labelStyleTextFormField,
              hintStyle: hintStyleTextFormField,
              hintText: "Enter Church Name"),
        ),
      ],
    );
  }
}
