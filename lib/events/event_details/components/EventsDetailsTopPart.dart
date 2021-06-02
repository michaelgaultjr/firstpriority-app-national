import 'package:first_priority_app/events/controller/EventsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants.dart';

class EventsDetailsTopPart extends StatelessWidget {
  final EventsController _eventsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 60.0,
          ),
          Text(
            _eventsController.eventDetailsTitle.value,
            style: getCustomTextProperties(
                Colors.black54, 16, fontSchylerRegular, 1),
          ),
          Text(
            _eventsController.eventDetailsSubTitle.value,
            style:
                getCustomTextProperties(Colors.black, 30, fontSchylerRegular, 1),
          ),
          SizedBox(
            height: 6.0,
          ),
          Text(
            _eventsController.eventRoomTimeText.value,
            style: getCustomTextProperties(
                Colors.black54, 16, fontSchylerRegular, 1),
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
