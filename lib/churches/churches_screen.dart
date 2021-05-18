import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChurchesScreen extends StatelessWidget {
  List a = [
    "City Church \n7475 Lakeside Blvd \nMaimi FL",
    "City Church \n7475 Lakeside Blvd \nMaimi FL",
    "City Church \n7475 Lakeside Blvd \nMaimi FL",
    "City Church \n7475 Lakeside Blvd \nMaimi FL",
    "City Church \n7475 Lakeside Blvd \nMaimi FL",
    "City Church \n7475 Lakeside Blvd \nMaimi FL",
    "City Church \n7475 Lakeside Blvd \nMaimi FL",
    "City Church \n7475 Lakeside Blvd \nMaimi FL",
    "City Church \n7475 Lakeside Blvd \nMaimi FL",
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
              'Churches',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext ctx, int index) {
                return Container(
                    margin: EdgeInsets.only(left: 10, bottom: 10),
                    child: Text(
                      a[index],
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ));
              },
              itemCount: a.length,
            ),
          )
        ]);
  }
}
