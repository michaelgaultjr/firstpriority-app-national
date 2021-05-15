import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
              'MONDAY SEPTEMBER 27',
              style: TextStyle(color: Colors.black54),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              'Home',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: Get.width,
                      child: Image(
                          image: AssetImage('assets/images/nature.jpeg'),
                          fit: BoxFit.fitWidth),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10.0, top: 10.0),
                            child: Text(
                              'DEVOTIONAL',
                              style: TextStyle(color: Colors.black54),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                              'Build Intentional \n Frientship in the New \n School Year',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
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
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              'Read the Devotional',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20.0, top: 10.0),
                            child: Text(
                              'Connect with God Daily.',
                              style: TextStyle(color: Colors.black54),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 80),
                        alignment: Alignment.centerRight,
                        height: 40,
                        width: 80,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.black12,
                          color: Colors.black12,
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: () {},
                            child: Center(
                              child: Text(
                                'Read',
                                style: TextStyle(
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.bold),
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
                    style: TextStyle(color: Colors.black54),
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
                              child: Text(
                                'SEP \n 29',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
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
        ],
      ),
    );
  }
}
