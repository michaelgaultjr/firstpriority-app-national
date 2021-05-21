import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Constants.dart';

class TopHomePart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 60.0,
        ),
        Container(
          margin: EdgeInsets.only(left: 10.0, top: 10.0),
          child: Text(
            'MONDAY, SEPTEMBER 27',
            style: getCustomTextProperties(
                Colors.black54, 16, fontSchylerRegular, 1),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10, top: 8),
          child: Text(
            'Home',
            style: getCustomTextProperties(
                Colors.black, 30, fontSchylerRegular, 1),
          ),
        ),
      ],
    );
  }
}
