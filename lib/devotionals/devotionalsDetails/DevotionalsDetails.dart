import 'package:first_priority_app/devotionals/controller/DevotionalsController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constants.dart';

class DevotionalsDetailsScreen extends StatelessWidget {
  final DevotionalsController _devotionalsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                  width: Get.width,
                  height: Get.height / 3,
                  image: AssetImage('assets/images/devontionalProfile.png'),
                  fit: BoxFit.cover),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                 _devotionalsController.devotionalDetailsTitle.value,
                  style: getCustomTextProperties(Colors.black, 30, fontSchylerRegular, 1),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  _devotionalsController.devotionalDetailsDescription.value,
                  style: getCustomTextProperties(colorEventDetailText, 15, fontSchylerRegular, 2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
