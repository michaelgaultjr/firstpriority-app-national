import 'package:first_priority_app/events/controller/EventsController.dart';
import 'package:first_priority_app/events/newevent/subComponent/DropDownCycle.dart';
import 'package:first_priority_app/events/newevent/subComponent/DropDownWeek.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';

import '../../../Constants.dart';

class TopNewEventPart extends StatelessWidget {
  final EventsController _eventsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30.0,
          ),
          GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back)),
          SizedBox(
            height: 20,
          ),
          Text(
            'Events',
            style: getCustomTextProperties(
                Colors.black, 30, fontSchylerRegular, 1),
          ),
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              hintText: 'Club Name',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: colorLightDark),
              ),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            'Details',
            style: getCustomTextProperties(
                colorEventDetailText, 30, fontSchylerRegular, 1),
          ),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: DateTime(2001, 3, 5),
                  maxTime: DateTime(2030, 6, 7), onChanged: (date) {
                print('change $date');
              }, onConfirm: (date) {
                print('confirm $date');
                _eventsController.setDateFormat(date, 1);
              }, currentTime: DateTime.now(), locale: LocaleType.en);
            },
            child: Text(
              'Event Date:',
              style: getCustomTextProperties(
                  Colors.black, 16, fontSchylerRegular, 1),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Obx(
            () => Text(
              _eventsController.selectedEventDate.value,
              style: getCustomTextProperties(
                  colorLightDark, 14, fontSchylerRegular, 0),
            ),
          ),
          SizedBox(
            height: 19,
          ),
          GestureDetector(
            onTap: () {
              DatePicker.showTimePicker(context,
                  showTitleActions: true,
                  showSecondsColumn: false, onChanged: (date) {
                print('change $date');
              }, onConfirm: (date) {
                print('confirm $date');
                _eventsController.setDateFormat(date, 0);
              }, currentTime: DateTime.now(), locale: LocaleType.en);
            },
            child: Text(
              'Event Time:',
              style: getCustomTextProperties(
                  Colors.black, 16, fontSchylerRegular, 1),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Obx(
            () => Text(
              _eventsController.selectedEventTime.value,
              style: getCustomTextProperties(
                  colorLightDark, 14, fontSchylerRegular, 0),
            ),
          ),
          SizedBox(
            height: 19,
          ),
          Text(
            'Cycle:',
            style: getCustomTextProperties(
                Colors.black, 16, fontSchylerRegular, 1),
          ),
          SizedBox(
            height: 10,
          ),
          DropDownCycle(),
          SizedBox(
            height: 19,
          ),
          Text(
            'Week:',
            style: getCustomTextProperties(
                Colors.black, 16, fontSchylerRegular, 1),
          ),
          SizedBox(
            height: 10,
          ),
          DropDownWeek(),
        ],
      ),
    );
  }
}
