import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Constants.dart';

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
            margin: EdgeInsets.only(left: 15, top: 8),
            child: Text(
              'Devotionals',
              style: getCustomTextProperties(Colors.black, 30, "Schyler", 1),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 8),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext ctx, int index) {
                  return Container(
                    height: 110,
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 6,
                          child: Container(
                            width: 90,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/home_card.jpg'),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Expanded(
                          flex: 14,
                          child: Container(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(tiles[index],
                                style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                        )
                      ],
                    ),
                  );
                  ;
                },
                itemCount: tiles.length,
              ),
            ),
          )
        ]);
  }
}
