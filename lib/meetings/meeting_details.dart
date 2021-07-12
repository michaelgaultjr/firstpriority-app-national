import 'package:first_priority_app/controllers/message.dart';
import 'package:first_priority_app/controllers/school.dart';
import 'package:first_priority_app/meetings/controller/meeting_controller.dart';
import 'package:first_priority_app/models/meeting.dart';
import 'package:first_priority_app/models/school.dart';
import 'package:first_priority_app/report/report_screen.dart';
import 'package:first_priority_app/widgets/back_app_bar.dart';
import 'package:first_priority_app/widgets/dialogs/select_dialog.dart';
import 'package:first_priority_app/widgets/loading_dialog.dart';
import 'package:first_priority_app/widgets/policy_builder.dart';
import 'package:first_priority_app/widgets/text/title_text.dart';
import 'package:first_priority_app/widgets/text/subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class MeetingDetails extends StatefulWidget {
  final Meeting meeting;

  MeetingDetails({Key key, @required this.meeting}) : super(key: key);

  @override
  _MeetingDetailsState createState() => _MeetingDetailsState();
}

class _MeetingDetailsState extends State<MeetingDetails> {
  final MeetingController _meetingController = Get.find<MeetingController>();
  final MessageController _messageController = Get.find<MessageController>();

  @override
  Widget build(BuildContext context) {
    final Meeting meeting = widget.meeting;

    return Scaffold(
      appBar: BackAppBar(
        title: "Meeting Details",
      ),
      floatingActionButton: PolicyBuilder(
        policy: Policy.manageMeetings,
        builder: (context, valid) {
          if (!valid) return Container();
          if (meeting.time.isBefore(DateTime.now())) return Container();

          return _buildSpeedDial(context);
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
                if (!valid) return Container();
                if (meeting.time.isBefore(DateTime.now())) return Container();

                return _buildReportPrompt();
              },
            ),
            TitleText("${widget.meeting.week} Week"),
            SizedBox(
              height: 8,
            ),
            SubtitleText(
              Jiffy(widget.meeting.time).format("EEEE, MMMM do"),
            ),
            SubtitleText(
              '${Jiffy(widget.meeting.time).format("h:mma")} • ${widget.meeting.room}',
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

  Widget _buildSpeedDial(BuildContext context) {
    return SpeedDial(
      foregroundColor:
          Theme.of(context).floatingActionButtonTheme.foregroundColor,
      backgroundColor:
          Theme.of(context).floatingActionButtonTheme.backgroundColor,
      elevation: Theme.of(context).floatingActionButtonTheme.elevation,
      icon: Icons.settings,
      activeIcon: Icons.close,
      overlayColor: Colors.black,
      overlayOpacity: 0,
      tooltip: 'Options',
      heroTag: 'options-hero-tag',
      children: [
        // SpeedDialChild(
        //   child: Icon(Icons.edit),
        //   backgroundColor: Theme.of(context).colorScheme.secondary,
        //   onTap: () => print('FIRST CHILD'),
        // ),
        SpeedDialChild(
          child: Icon(Icons.notifications_active),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          onTap: _buildSpeedDialNotificationsDialog,
        ),
      ],
    );
  }

  Future<void> _buildSpeedDialNotificationsDialog() async {
    final messages = await _messageController.get();

    await showDialog(
      context: context,
      builder: (context) {
        return SelectDialog(
          title: "Notifications",
          itemCount: messages.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(messages[index].name),
              onTap: () async {
                await LoadingDialog.show(
                  context: context,
                  future: () async {
                    _messageController.send(
                      widget.meeting.id,
                      messages[index].id,
                    );
                  },
                );
                Navigator.of(context).pop();
              },
            );
          },
        );
      },
    );
  }

  Widget _buildReportPrompt() {
    return FutureBuilder<bool>(
      future: _meetingController.hasReport(widget.meeting.time),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container();
        }

        if ((snapshot.data ?? false) == false) {
          return Container();
        }

        return Column(
          children: [
            TitleText("Meeting Ended"),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  () => ReportScreen(
                    meeting: widget.meeting,
                  ),
                );
              },
              child: Text("Submit Report"),
            ),
            SizedBox(
              height: 16,
            ),
          ],
        );
      },
    );
  }
}
