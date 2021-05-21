import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../Constants.dart';

class TopDevotionalPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60.0,
        ),
        Container(
          margin: EdgeInsets.only(left: 15, top: 8),
          child: Text(
            'Devotionals',
            style: getCustomTextProperties(
                Colors.black, 30, fontSchylerRegular, 1),
          ),
        ),
      ],
    );
  }
}
