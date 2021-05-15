import 'package:first_priority_app/screens/sign_up/compotents/bottom_signUp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Constants.dart';

class Middle_signUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(startMargin, 20, startMargin, 0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              style: TextStyle(
                fontFamily: fontKarlaRegular,
              ),
              decoration: inputEditTextDecoration.copyWith(
                  labelText: "Name",
                  labelStyle: TextStyle(color: Colors.grey),
                  hintText: "Enter Name"),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(startMargin, 20, startMargin, 0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              style: TextStyle(fontFamily: fontKarlaRegular),
              decoration: inputEditTextDecoration.copyWith(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.grey),
                  hintText: "Enter Email"),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(startMargin, 20, startMargin, 0),
            child: TextFormField(
              style: TextStyle(fontFamily: fontKarlaRegular),
              decoration: inputEditTextDecoration.copyWith(
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.grey),
                  hintText: "Enter Password"),
              obscureText: true,
              keyboardType: TextInputType.text,
              obscuringCharacter: '*',
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(startMargin, 20, startMargin, 0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              style: TextStyle(fontFamily: fontKarlaRegular),
              decoration: inputEditTextDecoration.copyWith(
                  labelText: "Country",
                  labelStyle: TextStyle(color: Colors.grey),
                  hintText: "Enter Country"),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(startMargin, 20, startMargin, 0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              style: TextStyle(fontFamily: fontKarlaRegular),
              decoration: inputEditTextDecoration.copyWith(
                  labelText: "School",
                  labelStyle: TextStyle(color: Colors.grey),
                  hintText: "Enter School"),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(startMargin, 20, startMargin, 0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              style: TextStyle(fontFamily: fontKarlaRegular),
              decoration: inputEditTextDecoration.copyWith(
                  labelText: "Role",
                  labelStyle: TextStyle(color: Colors.grey),
                  hintText: "Enter Role"),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(startMargin, 20, startMargin, 0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              style: TextStyle(fontFamily: fontKarlaRegular),
              decoration: inputEditTextDecoration.copyWith(
                  labelText: "Graduating Class",
                  labelStyle: TextStyle(color: Colors.grey),
                  hintText: "Enter Graduating Class"),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(startMargin, 20, startMargin, 0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              style: TextStyle(fontFamily: fontKarlaRegular),
              decoration: inputEditTextDecoration.copyWith(
                  labelText: "Church Name",
                  labelStyle: TextStyle(color: Colors.grey),
                  hintText: "Enter Church Name"),
            ),
          ),
          Container(
            child: Bootom_SignUp(),
          )
        ],
      ),
    ));
  }
}
