import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventsScreen extends StatelessWidget {
  final titles = [
    "Weekly Meeting: Equip",
    "Weekly Meeting: Equip",
    "Weekly Meeting: Equip",
    "Weekly Meeting: Equip",
    "Weekly Meeting: Equip",
    "Weekly Meeting: Equip",
    "Weekly Meeting: Equip",
    "Weekly Meeting: Equip",
    "Weekly Meeting: Equip",
    "Weekly Meeting: Equip"
  ];
  final subtitles = [
    "Vero Central High School: Room 567",
    "Vero Central High School: Room 567",
    "Vero Central High School: Room 567",
    "Vero Central High School: Room 567",
    "Vero Central High School: Room 567",
    "Vero Central High School: Room 567",
    "Vero Central High School: Room 567",
    "Vero Central High School: Room 567",
    "Vero Central High School: Room 567",
    "Vero Central High School: Room 567"
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
              'Events',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: titles.length,
                itemBuilder: (context, index) {
                  return Container(
                      child: ListTile(
                    title: Text(titles[index]),
                    subtitle: Text(subtitles[index]),
                    leading: Container(
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
                  ));
                }),
          )
        ]);
  }
}
