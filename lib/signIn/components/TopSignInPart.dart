import 'package:first_priority_app/signUp/subComponents/LogoImage.dart';
import 'package:flutter/material.dart';
import '../../Constants.dart';

class TopSignInPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 15,
        ),
        LogoImage(),
        Container(
          margin: EdgeInsets.only(top: 32.0),
          child: Text(
            "Sign In",
            style: getCustomTextProperties(
                Colors.black, 25, fontSchylerRegular, 1),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 16.0),
          alignment: Alignment.center,
          child: Center(
            child: Text(
              "Sign into your First Priority account to access"
              "events devotionals, and resources. ",
              style: getCustomTextProperties(
                  Colors.grey, 12, fontSchylerRegular, 0),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
