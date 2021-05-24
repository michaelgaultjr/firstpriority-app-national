import 'package:first_priority_app/home/Controller/HomeController.dart';
import 'package:first_priority_app/home/homeScreen/components/BottomHomePart.dart';
import 'package:first_priority_app/home/homeScreen/components/MiddleHomePart.dart';
import 'package:first_priority_app/home/homeScreen/components/TopHomePart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopHomePart(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 8),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MiddleHomePart(),
                    SizedBox(
                      height: 10.0,
                    ),
                    BottomHomePart(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
