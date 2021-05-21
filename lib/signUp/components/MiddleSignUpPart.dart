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
              labelStyle: getCustomTextProperties(
                  Colors.grey, 16, fontSchylerRegular, 0),
              hintText: "Enter Name",
              hintStyle: getCustomTextProperties(
                  Colors.black54, 16, fontSchylerRegular, 1)),
        ),
        TextFormField(
          keyboardType: TextInputType.text,
          style: TextStyle(fontFamily: fontKarlaRegular),
          decoration: inputEditTextDecoration.copyWith(
              labelText: "Email",
              labelStyle: getCustomTextProperties(
                  Colors.grey, 16, fontSchylerRegular, 0),
              hintText: "Enter Email",
              hintStyle: getCustomTextProperties(
                  Colors.black54, 16, fontSchylerRegular, 1)),
        ),
        TextFormField(
          style: TextStyle(fontFamily: fontKarlaRegular),
          decoration: inputEditTextDecoration.copyWith(
              labelText: "Password",
              labelStyle: getCustomTextProperties(
                  Colors.grey, 16, fontSchylerRegular, 0),
              hintStyle: getCustomTextProperties(
                  Colors.black54, 16, fontSchylerRegular, 1),
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
              labelStyle: getCustomTextProperties(
                  Colors.grey, 16, fontSchylerRegular, 0),
              hintStyle: getCustomTextProperties(
                  Colors.black54, 16, fontSchylerRegular, 1),
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
              labelStyle: getCustomTextProperties(
                  Colors.grey, 16, fontSchylerRegular, 0),
              hintStyle: getCustomTextProperties(
                  Colors.black54, 16, fontSchylerRegular, 1),
              hintText: "Enter Role"),
        ),
        TextFormField(
          keyboardType: TextInputType.text,
          style: TextStyle(fontFamily: fontKarlaRegular),
          decoration: inputEditTextDecoration.copyWith(
              labelText: "Graduating Class",
              labelStyle: getCustomTextProperties(
                  Colors.grey, 16, fontSchylerRegular, 0),
              hintStyle: getCustomTextProperties(
                  Colors.black54, 16, fontSchylerRegular, 1),
              hintText: "Enter Graduating Class"),
        ),
        TextFormField(
          keyboardType: TextInputType.text,
          style: TextStyle(fontFamily: fontKarlaRegular),
          decoration: inputEditTextDecoration.copyWith(
              labelText: "Church Name",
              labelStyle: getCustomTextProperties(
                  Colors.grey, 16, fontSchylerRegular, 0),
              hintStyle: getCustomTextProperties(
                  Colors.black54, 16, fontSchylerRegular, 1),
              hintText: "Enter Church Name"),
        ),
      ],
    );
  }
}
