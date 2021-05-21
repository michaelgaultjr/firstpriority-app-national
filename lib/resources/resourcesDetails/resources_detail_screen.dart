import 'package:first_priority_app/resources/controller/ResourcesController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants.dart';

class ResourcesDetails extends StatelessWidget {
  final ResourcesController _resourcesController = Get.put(ResourcesController());
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 80.0,
          ),
          Container(
            margin: EdgeInsets.only(left: 10, top: 10),
            child: Text(
              _resourcesController.titleText.value,
              style: getCustomTextProperties(Colors.black, 30, "Schyler", 1),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
              margin: EdgeInsets.all(10),
              child: Image(
                  image: AssetImage(_resourcesController.selectedImage.value),
                  fit: BoxFit.cover)),
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              'Orci Verb set neculer static road heat set Orci Verb set neculer static road heat set'
              'Orci Verb set neculer static road heat set'
              'Orci Verb set neculer static road heat set Orci Verb set neculer static road heat set Orci Verb set neculer static road heat set Orci Verb set neculer static road heat set'
              'Orci Verb set neculer static road heat set'
              'Orci Verb set neculer static road heat set',
              style:
                  getCustomTextProperties(colorEventDetailText, 15, "Schyler", 2),
            ),
          ),
          Container(
            width: Get.width,
            margin: EdgeInsets.only(right: 10),
            child: Align(
              alignment: Alignment.topRight,
              child: TextButton(
                style: textButtonStyle,
                onPressed: () {},
                child: Text('VISIT'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
