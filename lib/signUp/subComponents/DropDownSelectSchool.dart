import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constants.dart';
import '../controller/SignUpController.dart';

class DropDownSelectSchool extends StatelessWidget {
  final SignUpController _signUpController = Get.put(SignUpController());

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
                color: Colors.grey,
              ),
              value: _signUpController.schoolSelectedValue.value == ''
                  ? _signUpController.schoolSelected
                  : _signUpController.schoolSelectedValue.value,
              iconSize: 24,
              selectedItemBuilder: (BuildContext context) {
                return _signUpController.schoolList.map<Widget>((String item) {
                  return Text(item);
                }).toList();
              },
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: fontSchylerRegular),
              underline: Container(
                height: 1,
                color: colorLightbackground,
              ),
              onChanged: (String data) {
                _signUpController.schoolSelectedValue.value = data;
              },
              items: _signUpController.schoolList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    overflow: TextOverflow.ellipsis,
                    style: getCustomTextProperties(
                        Colors.grey, 16, fontSchylerRegular, 0),
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
