import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Constants.dart';

class MiddleProfile extends StatefulWidget {
  @override
  _MiddleProfileState createState() => _MiddleProfileState();
}

class _MiddleProfileState extends State<MiddleProfile> {
  TextEditingController _noteController;

  @override
  void initState() {
    super.initState();
    _noteController = TextEditingController.fromValue(
      TextEditingValue(
        text: 'widget..note',
      ),
    );
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.fromLTRB(startMargin, 20, startMargin, 0),
                child: TextFormField(
                    initialValue: "mark.teney@gmail.com",
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                        fontFamily: fontKarlaRegular, color: Colors.black54),
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                    ))),
            Container(
                margin: EdgeInsets.fromLTRB(startMargin, 20, startMargin, 0),
                child: TextFormField(
                    initialValue: "Lake County",
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                        fontFamily: fontKarlaRegular, color: Colors.black54),
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                    ))),
            Container(
                margin: EdgeInsets.fromLTRB(startMargin, 20, startMargin, 0),
                child: TextFormField(
                    initialValue: "Lake High School",
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                        fontFamily: fontKarlaRegular, color: Colors.black54),
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                    ))),
            Container(
                margin: EdgeInsets.fromLTRB(startMargin, 20, startMargin, 0),
                child: TextFormField(
                    initialValue: "Class of 2025",
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                        fontFamily: fontKarlaRegular, color: Colors.black54),
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                    ))),
            Container(
                margin: EdgeInsets.fromLTRB(startMargin, 20, startMargin, 0),
                child: TextFormField(
                    initialValue: "City Church",
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                        fontFamily: fontKarlaRegular, color: Colors.black54),
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                    ))),
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
