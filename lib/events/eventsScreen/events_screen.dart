import 'package:first_priority_app/events/controller/EventsController.dart';
import 'package:first_priority_app/events/eventsScreen/components/BottomEventPart.dart';
import 'package:first_priority_app/events/eventsScreen/components/TopEventPart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constants.dart';
import '../event_details/events_details.dart';

class EventsScreen extends StatelessWidget {
  final EventsController _eventsController = Get.put(EventsController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[TopEventPart(), BottomEventPart()],
    );
  }
}
