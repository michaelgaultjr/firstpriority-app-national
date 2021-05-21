import 'package:first_priority_app/events/controller/EventsController.dart';
import 'package:first_priority_app/events/eventsScreen/subComponents/EventVedioView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../Constants.dart';

class EventsDetails extends StatelessWidget {
  EventsDetails({Key key}) : super(key: key);
  final EventsController _eventsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 60.0,
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0, top: 10.0),
              child: Text(
                _eventsController.eventDetailsTitle.value,
                style: getCustomTextProperties(
                    Colors.black54, 16, fontSchylerRegular, 1),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 10),
              child: Text(
                _eventsController.eventDetailsSubTitle.value,
                style: getCustomTextProperties(
                    Colors.black, 30, fontSchylerRegular, 1),
              ),
            ),
            EventVedioView(),
            Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  _eventsController.eventDetailsDescription.value,
                  style: getCustomTextProperties(
                      colorEventDetailText, 15, fontSchylerRegular, 2),
                ))
          ]),
    );
  }
}
