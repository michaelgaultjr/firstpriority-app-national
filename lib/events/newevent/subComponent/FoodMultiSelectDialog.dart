import 'package:first_priority_app/events/controller/EventsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';

import '../../../Constants.dart';

class FoodMultiSelectDialog extends StatelessWidget {
  final EventsController _eventsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MultiSelectDialogField(
          items: _eventsController.discussionItems,
          searchable: true,
          backgroundColor: Colors.white,
          selectedItemsTextStyle: TextStyle(color: Colors.black),
          selectedColor: Colors.black,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(0)),
            border: Border.all(
              color: Colors.white,
              width: 0,
            ),
          ),
          buttonIcon: Icon(
            Icons.pets,
            color: Colors.white,
          ),
          buttonText: Text(
            "Food Order:",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          onConfirm: (results) {
            _eventsController.foodText.value = '';
            results.forEach((element) {
              if( _eventsController.foodText.value == ''){
                _eventsController.foodText.value =element.name;
              }else {
                _eventsController.foodText.value =
                    _eventsController.foodText.value + ', ' + element.name;
              }});
          },
        ),
        Obx(()=> Container(
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Text(
            _eventsController.foodText.value,
            style: getCustomTextProperties(
                colorLightDark, 14, fontSchylerRegular, 0),
          ),
        ),
        ),
      ],
    );
  }
}
