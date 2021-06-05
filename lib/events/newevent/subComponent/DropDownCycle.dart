import 'package:first_priority_app/events/controller/EventsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constants.dart';

class DropDownCycle extends StatelessWidget {
  final EventsController _eventsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Obx(
            () => DropdownButton<String>(
              isExpanded: true,
              isDense: true,
              icon: Icon(
                Icons.keyboard_arrow_down_sharp,
                color: Colors.white,
              ),
              value:_eventsController.cycleSelectedValue.value,
              iconSize: 24,
              selectedItemBuilder: (BuildContext context) {
                return _eventsController.cycleList.map<Widget>((String item) {
                  return Text(item);
                }).toList();
              },
              style: TextStyle(
                  color: colorLightDark,
                  fontSize: 14,
                  fontFamily: fontSchylerRegular),
              underline: Container(
                height: 1,
                color: Colors.white,
              ),
              onChanged: (String data) {
                _eventsController.cycleSelectedValue.value = data;
              },
              items: _eventsController.cycleList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    overflow: TextOverflow.ellipsis,
                    style: getCustomTextProperties(
                        colorLightDark, 16, fontSchylerRegular, 0),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
