import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constants.dart';

class MiddleHomePart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // semanticContainer: true,
          // clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20.0))),
                child: Image(
                  image: AssetImage('assets/images/home_card.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  margin: EdgeInsets.only(left: 10.0, top: 20.0),
                  child: Text(
                    'DEVOTIONAL',
                    style: getCustomTextProperties(
                        colorLightGray, 14, fontSchylerRegular, 0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
                  child: Text(
                    'Build Intentional\nFriendships in the New\nSchool Year',
                    style: getCustomTextProperties(
                        Colors.white, 32, fontSchylerRegular, 1),
                  ),
                ),
              ]),
            ],
          ),

          margin: EdgeInsets.all(10),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          margin: EdgeInsets.only(right: 5),
          width: Get.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Text(
                      'Read the Devotional',
                      style: getCustomTextProperties(
                          Colors.black, 16, fontSchylerRegular, 1),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4.0, left: 15),
                    child: Text(
                      'Connect with God Daily.',
                      style: getCustomTextProperties(
                          colorDarkGray, 11, fontSchylerRegular, 0),
                    ),
                  ),
                ],
              ),
              Container(
                height: 30,
                width: 80,
                margin: EdgeInsets.only(bottom: 4.0, right: 8),
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  color: colorLightGray,
                  child: GestureDetector(
                    onTap: () {},
                    child: Center(
                      child: Text(
                        'READ',
                        style: TextStyle(
                            color: colorDarkBlue1,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
