import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DevotionalsScreen extends StatelessWidget {
  List tiles = [
    "Build Intentioanl Relationship in the New School Year",
    "Build Intentioanl Relationship in the New School Year",
    "Build Intentioanl Relationship in the New School Year",
    "Build Intentioanl Relationship in the New School Year",
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
              'Devotionals',
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
                    margin: EdgeInsets.only(left: 5),
                    child: ListTile(
                      title: Text(tiles[index]),
                      leading: Container(
                        margin: EdgeInsets.only(left: 5),
                        alignment: Alignment.centerRight,
                        height: 90,
                        width: 60,
                        child: Image(
                            image: AssetImage('assets/images/nature.jpeg'),
                            fit: BoxFit.fitWidth),
                      ),
                    ));
                ;
              },
              itemCount: tiles.length,
            ),
          )
        ]);
  }
}
