import 'package:first_priority_app/home/Controller/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constants.dart';

class BottomHomePart extends StatelessWidget {
  HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 15.0, top: 20.0),
            child: Text(
              'DON\'T MISS ANYTHING',
              style: getCustomTextProperties(colorDarkGray, 16, "dd", 1),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15.0, top: 10.0),
            child: Text(
              'Upcoming Events',
              style: getCustomTextProperties(
                  Colors.black, 30, fontSchylerRegular, 1),
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
                              _homeController.textBottomHomeDate.value,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              _homeController.textBottomHomeDay.value,
                              style: getCustomTextProperties(
                                  colorButtonDark, 24, "dd", 1),
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
                        _homeController.textBottomDescriptionTitle.value,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15.0, top: 5.0),
                      child: Text(
                        _homeController.textBottomDescriptionSubTitle.value,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(10),
    );
  }
}
