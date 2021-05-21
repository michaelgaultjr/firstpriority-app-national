import 'package:first_priority_app/Constants.dart';
import 'package:first_priority_app/resources/controller/ResourcesController.dart';
import 'file:///H:/Android%20Studio%20Projects/firstpriority-app/lib/resources/ResourcesDetails/resources_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResourcesScreen extends StatelessWidget {
  final ResourcesController _resourcesController = Get.put(ResourcesController());

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
        Widget>[
      SizedBox(
        height: 60.0,
      ),
      Container(
        margin: EdgeInsets.all(10),
        child: Text(
          'Resources',
          style: getCustomTextProperties(Colors.black, 30, fontSchylerRegular, 1),
        ),
      ),
      Expanded(
        child: Container(
          padding: EdgeInsets.only(top: 8),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemBuilder: (BuildContext ctx, int index) {
              return GestureDetector(
                child: Container(
                  margin: EdgeInsets.all(8),
                  child: Image(
                      image: AssetImage(_resourcesController.imagesList[index]),
                      fit: BoxFit.cover),
                ),
                onTap: () {
                  _resourcesController.titleText.value = _resourcesController.titleList[index];
                  _resourcesController.selectedImage.value = _resourcesController.imagesList[index];
                  Get.to(ResourcesDetails());
                },
              );
            },
            itemCount: _resourcesController.imagesList.length,
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
