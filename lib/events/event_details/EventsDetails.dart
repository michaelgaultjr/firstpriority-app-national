import 'package:first_priority_app/events/controller/EventsController.dart';
import 'package:first_priority_app/events/event_details/components/EventsDetailsTopPart.dart';
import 'components/EventVedioView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constants.dart';
import 'components/EventsDetailsBottomPart.dart';

class EventsDetails extends StatelessWidget {
  EventsDetails({Key key}) : super(key: key);
  final EventsController _eventsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EventsDetailsTopPart(),
            EventVedioView(),
            EventsDetailsBottomPart()
          ],
        ),
      ),
    );
  }
}
