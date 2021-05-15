import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 90.0),
          child: Text(
            "Create account",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        Container(
          width: 360,
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 15.0, left: 40.0),
          child: Center(
            child: Text(
              "Create an account to access your club events,devotionals and notifications",
              style: TextStyle(
                fontSize: 15,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
