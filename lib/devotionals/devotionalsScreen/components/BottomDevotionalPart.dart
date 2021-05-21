import 'package:first_priority_app/devotionals/controller/DevotionalsController.dart';
import 'package:first_priority_app/devotionals/devotionalsDetails/DevotionalsDetails.dart';
import 'package:first_priority_app/devotionals/devotionalsScreen/subComponenets/DevotionalListItemView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomDevotionalPart extends StatelessWidget {
  final DevotionalsController _devotionalsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 8),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemBuilder: (BuildContext ctx, int index) {
            return GestureDetector(
              onTap: () {
                Get.to(() => DevotionalsDetailsScreen());
              },
              child: Container(
                height: 110,
                padding: const EdgeInsets.all(15),
                child: DevotionalListItemView(index),
              ),
            );
          },
          itemCount: _devotionalsController.tiles.length,
        ),
      ),
    );
  }
}
