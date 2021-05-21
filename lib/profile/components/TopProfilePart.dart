import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopProfilePart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 90.0),
            width: 90.0,
            height: 90.0,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/nature.jpeg'),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Text(
              "Mark Tenney",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Text(
              "Class of 2025",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
                decoration: TextDecoration.none,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
