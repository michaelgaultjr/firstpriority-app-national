import 'package:first_priority_app/signUp/subComponents/LogoImage.dart';
import 'package:first_priority_app/widgets/text/title_text.dart';
import 'package:flutter/material.dart';

class TopSignInPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          child: LogoImage(),
        ),
        Container(
          margin: EdgeInsets.only(top: 16),
          child: TitleText("Login"),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          alignment: Alignment.center,
          child: Center(
            child: Text(
              "Login to your First Priority account to access events devotionals, and resources.",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
