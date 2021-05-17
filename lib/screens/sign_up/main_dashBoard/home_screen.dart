import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 60.0,
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(
              'MONDAY, SEPTEMBER 27',
              style: getCustomTextProperties(Colors.black54,16,"Schyler",1),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10,top: 8),
            child: Text(
              'Home',
              style: getCustomTextProperties(Colors.black,30,"Schyler",1),
            ),
          ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 8),
            child: SingleChildScrollView(
              child: Column(children: [
                Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            child: Image(
                                image: AssetImage('assets/images/home_card.jpg'),
                                fit: BoxFit.cover),
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10.0, top: 10.0),
                                  child: Text(
                                    'DEVOTIONAL',
                                    style: getCustomTextProperties(colorLightGray,16,"Schyler",0),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  child: Text(
                                    'Build Intentional\nFrientship in the New\nSchool Year',
                                    style: getCustomTextProperties(Colors.white,25,"Schyler",1),
                                  ),
                                ),
                              ]),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
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
                                    style: getCustomTextProperties(Colors.black,16,"Schyler",1),
                                  ),
                                ),
                                Container(

                                  margin: EdgeInsets.only(top: 4.0,left: 15),
                                  child: Text(
                                    'Connect with God Daily.',
                                    style:  getCustomTextProperties(colorDarkGray,11,"Schyler",0),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 30,
                              width: 80,
                              margin: EdgeInsets.only(bottom: 4.0,right: 8),
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: colorLightGray,
                                color: colorLightGray,
                                elevation: 7.0,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Center(
                                    child: Text(
                                      'READ',
                                      style: getCustomTextProperties(Colors.indigo,11,"Schyler",1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15.0, top: 20.0),
                        child: Text(
                          'DON\'T MISS ANYTHING',
                          style: getCustomTextProperties(colorDarkGray,16,"dd",1),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0, top: 10.0),
                        child: Text(
                          'Upcoming Events',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: Get.width,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              alignment: Alignment.centerRight,
                              height: 60,
                              width: 70,
                              child: Material(
                                borderRadius: BorderRadius.circular(5.0),
                                shadowColor: Colors.black12,
                                color: Colors.black12,
                                elevation: 7.0,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'SEP',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '29',
                                          style: getCustomTextProperties(colorButtonDark,24,"dd",1),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 15),
                                  child: Text(
                                    'Weekly Meeting: Equip',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 15.0, top: 5.0),
                                  child: Text(
                                    'Vero Central High School: Room 567',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                ),
              ],),
            ),
          ),
        ),

        ],
      ),
    );
  }
}
