import 'package:flutter/material.dart';
import 'package:get/get.dart';

//SIZES AND MARGINS
// start margin for text sign in screen
double startMargin = 35;
double startMarginLogs = 20;
double startMarginDetailsLogs = 30;
double topMargin = Get.height / 10;
double logsItemPadding = 30;

//FONTS
var fontRubikRegular = 'Rubik';
var fontKarlaRegular = 'Karla';

//COLORS
Color colorDarkGreen = const Color.fromRGBO(62, 102, 62, 1);
Color colorGreen = const Color.fromRGBO(224, 235, 218, 1);
Color colorLightGray = const Color.fromRGBO(219, 219, 219, 1);
Color colorDarkGray = const Color.fromRGBO(167, 167, 167, 1);
Color colorLowLightGray = const Color.fromRGBO(219, 219, 219, 0.15);
Color colorWhite = const Color.fromRGBO(250, 250, 250, 1);
Color colorLightDark = const Color.fromRGBO(120, 120, 120, 1);
Color colorLightbackground = const Color.fromRGBO(51, 51, 51, 0.1);
Color colorGolden = const Color.fromRGBO(252, 185, 101, 1);
Color colorButtonDark = const Color.fromRGBO(29, 25, 26, 1);
Color colorLightBlue = const Color.fromRGBO(188, 222, 254, 1);


//WIDGETS

// top corners rounded
var roundedTopRectangleBorder = ShapeDecoration(
  color: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(40.0),
      topRight: Radius.circular(40.0),
    ),
  ),
);

// 2 color combination gradient for logs screen
var gradientBoxDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [colorLightGray, colorWhite],
  ),
);

var gradientMainScreenBoxDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [colorButtonDark, colorLightBlue],
  ),
);

// 2 color combination gradient for dashboard screen
var gradientDashboardBoxDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [colorGreen, colorWhite],
  ),
);

// edittext decoration
var inputEditTextDecoration = InputDecoration(
  hintText: "Enter your email",
  labelText: "Email",
  labelStyle: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),
  hintStyle: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w400),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: colorLightbackground),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: colorLightbackground),
  ),
  errorBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: colorLightbackground),
  ),
  focusedErrorBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: colorLightbackground),
  ),
);

var editTextOutlineDecoration = InputDecoration(
  labelStyle: TextStyle(fontSize: 14),
  hintStyle: TextStyle(fontSize: 16),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: colorLightbackground),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: colorLightbackground),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: colorLightbackground),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: colorLightbackground),
  ),
);

// rounded form bottm right corer only
var bottomRightCornerRoundedOnly = ShapeDecoration(
  color: colorLightGray,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomRight: Radius.circular(50.0),
    ),
  ),
);

// rounded form bottm right corer dashboard only
var bottomRightCornerRounded = ShapeDecoration(
  color: colorGreen,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomRight: Radius.circular(50.0),
    ),
  ),
);

// top left corner rounded Only
var topLeftCornerRoundedOnly = ShapeDecoration(
  color: colorWhite,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(50.0),
    ),
  ),
);

// sized box decoration
var sizedBoxDecoration = BoxDecoration(color: colorLightbackground);

// circular box decoration in yellow color
var circularBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(
      Radius.circular(200),
    ),
    color: colorGolden);

// rounded box decoration
var roundedBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
    color: colorLightGray);

var textButtonRoundedStyle = TextButton.styleFrom(
  backgroundColor: colorDarkGreen,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(30),
    ),
  ),
);

var textStyleLog = TextStyle(color: Colors.black, fontSize: 16, fontFamily: fontKarlaRegular,fontWeight: FontWeight.bold);
  getCustomTextProperties(
Color color, double fontSize, String fontName, int i) {
var dd;
if (i == 1) {
dd = FontWeight.w700;
} else {
dd = FontWeight.w400;
}
return new TextStyle(
// set color of text
color: color,
// set the font family as defined in pubspec.yaml
fontFamily: fontName,
// set the font weight
fontWeight: dd,
// set the font size
fontSize: fontSize);
}