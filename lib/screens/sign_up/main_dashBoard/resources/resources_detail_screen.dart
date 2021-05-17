import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Constants.dart';

class ResourcesDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 80.0,
          ),
          Container(
            margin: EdgeInsets.only(left: 10, top: 10),
            child: Text(
              'The Four',
              style: getCustomTextProperties(Colors.black, 30, "Schyler", 1),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
              margin: EdgeInsets.all(10),
              child: Image(
                  image: AssetImage('assets/images/resources1.jpg'),
                  fit: BoxFit.cover)),
          Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Orci Verb set neculer static road heat set Orci Verb set neculer static road heat set'
                'Orci Verb set neculer static road heat set'
                'Orci Verb set neculer static road heat set Orci Verb set neculer static road heat set Orci Verb set neculer static road heat set Orci Verb set neculer static road heat set'
                'Orci Verb set neculer static road heat set'
                'Orci Verb set neculer static road heat set',
                style: getCustomTextProperties(
                    colorEventDetailText, 15, "Schyler", 2),
              ))
        ]);
  }
}
