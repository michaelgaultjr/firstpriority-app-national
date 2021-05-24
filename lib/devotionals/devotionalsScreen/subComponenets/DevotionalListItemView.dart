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
        Container(
          width: 90,
          height: 80,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/home_card.jpg'),
                fit: BoxFit.fill),
          ),
        ),
       SizedBox(
         width: 5,
       ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              _devotionalsController.tiles[itemIndex],
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
