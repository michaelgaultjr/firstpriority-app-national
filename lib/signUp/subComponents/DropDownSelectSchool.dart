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
              hint: Text('', style: getCustomTextProperties(Colors.grey, 16, fontSchylerRegular, 0),),
              value: _signUpController.schoolSelectedValue.value == '' ? _signUpController.schoolSelected : _signUpController.schoolSelectedValue.value,
              iconSize: 24,
              style: textStyleLog,
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
                    style:
                        getCustomTextProperties(Colors.black, 16, fontSchylerRegular, 0),
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
