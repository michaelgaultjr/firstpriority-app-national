import 'package:first_priority_app/resources_details/resources_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResourcesScreen extends StatelessWidget {
  List a = [
    "assets/images/resources1.jpg",
    "assets/images/resources2.jpg",
    "assets/images/resources3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
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
              child: GestureDetector(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemBuilder: (BuildContext ctx, int index) {
                    return Container(
                      margin: EdgeInsets.all(8),
                      child:
                          Image(image: AssetImage(a[index]), fit: BoxFit.cover),
                    );
                  },
                  itemCount: a.length,
                ),
                onTap: () => _navigateToNextScreen(context),
              ),
            ),
          )
        ]);
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ResourcesDetails()));
  }
}
