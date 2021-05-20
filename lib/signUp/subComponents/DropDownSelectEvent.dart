import 'package:first_priority_app/signUp/SignUpControlar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants.dart';

class DropDownSelectEvent extends StatefulWidget {
  @override
  _DropDownSelectEventState createState() => _DropDownSelectEventState();
}

class _DropDownSelectEventState extends State<DropDownSelectEvent> {
  final SignUpController _dashboardController = Get.put(SignUpController());

  var currentSelectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: DropdownButton<String>(
            isExpanded: true,
            isDense: true,
            icon: Icon(
              Icons.keyboard_arrow_down_sharp,
              color: Colors.grey,
            ),
            hint: Text(
              '',
              style: getCustomTextProperties(Colors.grey, 16, "Schyler", 0),
            ),
            value: currentSelectedValue,
            iconSize: 24,
            style: textStyleLog,
            underline: Container(
              height: 1,
              color: colorLightbackground,
            ),
            onChanged: (String data) {
              setState(() {
                currentSelectedValue = data;
              });
            },
            items: _dashboardController.fieldMgrDamageDropDownItems
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  overflow: TextOverflow.ellipsis,
                  style:
                      getCustomTextProperties(Colors.black, 16, "Schyler", 0),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
