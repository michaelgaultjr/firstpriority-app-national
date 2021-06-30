import 'package:first_priority_app/meetings/controller/meeting_controller.dart';
import 'package:first_priority_app/meetings/meeting_preview.dart';
import 'package:first_priority_app/models/event.dart';
import 'package:first_priority_app/widgets/text/header_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpcomingEventCard extends StatelessWidget {
  final _meetingController = Get.find<MeetingController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 15, top: 20),
              child: Text(
                "DON'T MISS ANYTHING",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, top: 10),
              child: HeaderText('Upcoming Events'),
            ),
            SizedBox(
              height: 10,
            ),
            FutureBuilder<List<Meeting>>(
                future: _meetingController.getUpcoming(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return Column(
                    children: List.generate(snapshot.data.length, (index) {
                      return MeetingPreview(
                        meeting: snapshot.data[index],
                      );
                    }),
                  );
                }),
            SizedBox(
              height: 30,
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(8),
      ),
    );
  }
}
