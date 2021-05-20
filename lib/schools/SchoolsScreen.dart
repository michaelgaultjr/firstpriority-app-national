import 'package:first_priority_app/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SchoolsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              'Schools',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (BuildContext ctx, int index) {
                return Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 70,
                        height: 60,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/home_card.jpg'),
                                fit: BoxFit.fill)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Miami Central High School',
                          style: getCustomTextProperties(Colors.black, 16, 'Schyler', 1))
                    ],
                  ),
                );
              },
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
