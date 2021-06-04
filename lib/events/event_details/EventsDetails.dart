import 'package:first_priority_app/events/event_details/components/EventsDetailsTopPart.dart';
import 'package:flutter/material.dart';
import 'components/EventsDetailsBottomPart.dart';

class EventsDetails extends StatelessWidget {
  EventsDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EventsDetailsTopPart(),
            EventsDetailsBottomPart(),
          ],
        ),
      ),
    );
  }
}
