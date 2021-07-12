import 'package:first_priority_app/meetings/controller/meeting_controller.dart';
import 'package:first_priority_app/meetings/meeting_preview.dart';
import 'package:first_priority_app/models/meeting.dart';
import 'package:first_priority_app/widgets/text/title_text.dart';
import 'package:first_priority_app/widgets/text/subtitle_text.dart';
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
                child: SubtitleText("DON'T MISS ANYTHING")),
            Container(
              margin: EdgeInsets.only(left: 15, top: 10),
              child: TitleText('Upcoming Meetings'),
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

                if (snapshot.data.isEmpty) {
                  return Center(
                    child: SubtitleText(
                      "No Upcoming Meetings",
                      fontSize: 18,
                    ),
                  );
                }

                return Column(
                  children: List.generate(snapshot.data.length, (index) {
                    return MeetingPreview(
                      meeting: snapshot.data[index],
                    );
                  }),
                );
              },
            ),
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
