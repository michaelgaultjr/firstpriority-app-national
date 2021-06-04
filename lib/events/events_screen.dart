import 'package:first_priority_app/events/controller/EventsController.dart';
import 'package:first_priority_app/events/event_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventsScreen extends StatelessWidget {
  final EventsController _controller = Get.put(EventsController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: _controller.events.length,
        itemBuilder: (context, index) {
          return Container(
            child: EventPreview(
              event: _controller.events[index],
            ),
          );
        },
      ),
    );
  }
}
