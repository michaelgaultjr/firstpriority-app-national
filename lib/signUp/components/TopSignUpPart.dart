import 'package:first_priority_app/signUp/subComponents/LogoImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Constants.dart';

class TopSignUpPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LogoImage(),
        Container(
          margin: EdgeInsets.only(top: 32.0),
          child: Text(
            "Create account",
            style: getCustomTextProperties(
                Colors.black, 25, fontSchylerRegular, 1),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 16.0),
          alignment: Alignment.center,
          child: Center(
            child: Text(
              "Create an account to access your club events, devotionals, and notifications. ",
              style: getCustomTextProperties(
                  Colors.grey, 12, fontSchylerRegular, 0),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
