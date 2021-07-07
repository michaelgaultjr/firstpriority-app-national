import 'package:first_priority_app/models/event.dart';
import 'package:first_priority_app/widgets/back_app_bar.dart';
import 'package:first_priority_app/widgets/dialogs/select_dialog.dart';
import 'package:first_priority_app/widgets/policy_builder.dart';
import 'package:first_priority_app/widgets/text/title_text.dart';
import 'package:first_priority_app/widgets/text/subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class MeetingDetails extends StatelessWidget {
  final Meeting meeting;

  MeetingDetails({Key key, @required this.meeting}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar(
        title: "Meeting Details",
      ),
      floatingActionButton: PolicyBuilder(
        policy: Policy.manageMeetings,
        builder: (context, valid) {
          return FloatingActionButton(
            child: Icon(Icons.notifications_active),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return SelectDialog(
                    title: "Notifications",
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text("Reminder"),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PolicyBuilder(
              policy: Policy.manageMeetings,
              builder: (context, valid) {
                if (valid && meeting.time.isBefore(DateTime.now())) {
                  return Column(
                    children: [
                      TitleText("Meeting Ended"),
                      SizedBox(
                        height: 8,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Submit Report"),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  );
                }

                return Container();
              },
            ),
            TitleText("${meeting.week} Week"),
            SizedBox(
              height: 8,
            ),
            SubtitleText(
              Jiffy(meeting.time).format("EEEE, MMMM do"),
            ),
            SubtitleText(
              '${Jiffy(meeting.time).format("h:mma")} • ${meeting.room}',
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Divider(),
            ),
            TitleText("Roles"),
            if (meeting.roles.isNotEmpty)
              ListView.separated(
                shrinkWrap: true,
                itemCount: meeting.roles.keys.length,
                itemBuilder: (context, index) {
                  var key = meeting.roles.keys.toList()[index];
                  return ListTile(
                    title: Text(key),
                    subtitle: Text(meeting.roles[key].join(', ')),
                  );
                },
                separatorBuilder: (contxt, _) => const Divider(),
              ),
            if (meeting.roles.isEmpty)
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Center(
                  child: SubtitleText(
                    "No Meeting Roles",
                    fontSize: 24,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
