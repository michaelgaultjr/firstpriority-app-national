import 'package:first_priority_app/events/event_details/EventsDetails.dart';
import 'package:first_priority_app/models/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class EventPreview extends StatelessWidget {
  final Event event;

  const EventPreview({Key key, @required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => EventsDetails());
      },
      child: ListTile(
        title: Text(
          'Weekly Meeting: ${event.weekType}',
          style: Theme.of(context).textTheme.headline3,
        ),
        subtitle: Text(
          '${event.schoolName}: ${event.room}',
          style: Theme.of(context).textTheme.headline4,
        ),
        leading: InkWell(
          child: Container(
            // margin: EdgeInsets.only(left: 10),
            alignment: Alignment.centerRight,
            height: 60,
            width: 70,
            child: Material(
              borderRadius: BorderRadius.circular(5.0),
              shadowColor: Colors.black12,
              color: Theme.of(context).secondaryHeaderColor,
              elevation: 5,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'SEP',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '29',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(fontWeight: FontWeight.w700, fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
