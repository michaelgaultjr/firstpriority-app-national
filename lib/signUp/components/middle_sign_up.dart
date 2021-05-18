import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Constants.dart';
import 'bottom_signUp.dart';

class Middle_signUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 16),
        child: SingleChildScrollView(
            child: Container(
          child: Column(
            children: [
              Container(
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    fontFamily: fontKarlaRegular,
                  ),
                  decoration: inputEditTextDecoration.copyWith(
                      labelText: "Name",
                      labelStyle: getCustomTextProperties(Colors.grey,16,"Schyler",0),
                      hintText: "Enter Name",
                  hintStyle: getCustomTextProperties(Colors.black54,16,"Schyler",1)),
                ),
              ),
              Container(
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontFamily: fontKarlaRegular),
                  decoration: inputEditTextDecoration.copyWith(
                      labelText: "Email",
                      labelStyle: getCustomTextProperties(Colors.grey,16,"Schyler",0),
                      hintText: "Enter Email",
                  hintStyle: getCustomTextProperties(Colors.black54,16,"Schyler",1)),
                ),
              ),
              Container(
                child: TextFormField(
                  style: TextStyle(fontFamily: fontKarlaRegular),
                  decoration: inputEditTextDecoration.copyWith(
                      labelText: "Password",
                      labelStyle: getCustomTextProperties(Colors.grey,16,"Schyler",0),
                      hintStyle: getCustomTextProperties(Colors.black54,16,"Schyler",1),
                      hintText: "Enter Password"),
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  obscuringCharacter: '*',
                ),
              ),
              Container(
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontFamily: fontKarlaRegular),
                  decoration: inputEditTextDecoration.copyWith(
                      labelText: "Country",
                      labelStyle: getCustomTextProperties(Colors.grey,16,"Schyler",0),
                      hintStyle: getCustomTextProperties(Colors.black54,16,"Schyler",1),
                      hintText: "Enter Country"),
                ),
              ),
              Container(
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontFamily: fontKarlaRegular),
                  decoration: inputEditTextDecoration.copyWith(
                      labelText: "School",
                      labelStyle: getCustomTextProperties(Colors.grey,16,"Schyler",0),
                      hintStyle: getCustomTextProperties(Colors.black54,16,"Schyler",1),
                      hintText: "Enter School"),
                ),
              ),
              Container(
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontFamily: fontKarlaRegular),
                  decoration: inputEditTextDecoration.copyWith(
                      labelText: "Role",
                      labelStyle: getCustomTextProperties(Colors.grey,16,"Schyler",0),
                      hintStyle: getCustomTextProperties(Colors.black54,16,"Schyler",1),
                      hintText: "Enter Role"),
                ),
              ),
              Container(
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontFamily: fontKarlaRegular),
                  decoration: inputEditTextDecoration.copyWith(
                      labelText: "Graduating Class",
                      labelStyle: getCustomTextProperties(Colors.grey,16,"Schyler",0),
                      hintStyle: getCustomTextProperties(Colors.black54,16,"Schyler",1),
                      hintText: "Enter Graduating Class"),
                ),
              ),
              Container(
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontFamily: fontKarlaRegular),
                  decoration: inputEditTextDecoration.copyWith(
                      labelText: "Church Name",
                      labelStyle: getCustomTextProperties(Colors.grey,16,"Schyler",0),
                      hintStyle: getCustomTextProperties(Colors.black54,16,"Schyler",1),
                      hintText: "Enter Church Name"),
                ),
              ),
              Container(
                child: Bootom_SignUp(),
              )
            ],
          ),
        )),
      ),
    );
  }
}
