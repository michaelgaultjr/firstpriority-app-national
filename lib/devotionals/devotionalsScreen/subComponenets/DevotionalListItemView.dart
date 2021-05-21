import 'package:first_priority_app/devotionals/controller/DevotionalsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DevotionalListItemView extends StatelessWidget {
  final DevotionalsController _devotionalsController = Get.find();
  var itemIndex;

  DevotionalListItemView(int index) {
    itemIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 6,
          child: Container(
            width: 90,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/home_card.jpg'),
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
            child: Text(_devotionalsController.tiles[itemIndex],
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold)),
          ),
        )
      ],
    );
  }
}
