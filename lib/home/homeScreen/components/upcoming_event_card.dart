import 'package:first_priority_app/events/event_preview.dart';
import 'package:first_priority_app/models/event.dart';
import 'package:flutter/material.dart';

class UpcomingEventCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 15.0, top: 20.0),
            child: Text(
              "DON'T MISS ANYTHING",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15.0, top: 10.0),
            child: Text(
              'Upcoming Events',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          EventPreview(
            event: Event(
                room: 'Room 404',
                schoolName: 'Example School',
                weekType: 'Invite'),
          ),
          SizedBox(
            height: 30.0,
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.all(8),
    );
  }
}
