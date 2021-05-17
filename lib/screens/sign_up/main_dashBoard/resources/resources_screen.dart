import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResourcesScreen extends StatelessWidget {
  List a = [
    "assets/images/resources1.jpg",
    "assets/images/resources2.jpg",
    "assets/images/resources3.jpg",
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
            margin: EdgeInsets.all(10),
            child: Text(
              'Resources',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 8),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext ctx, int index) {
                  return Container(
                      margin: EdgeInsets.all(8),
                      child: Image(
                          image: AssetImage(a[index]), fit: BoxFit.cover));
                },
                itemCount: a.length,
              ),
            ),
          )
        ]);
  }
}
