import 'package:first_priority_app/meetings/controller/meeting_controller.dart';
import 'package:first_priority_app/meetings/meeting_create.dart';
import 'package:first_priority_app/meetings/meeting_preview.dart';
import 'package:first_priority_app/models/meeting.dart';
import 'package:first_priority_app/widgets/policy_builder.dart';
import 'package:first_priority_app/widgets/text/title_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeetingScreen extends StatefulWidget {
  @override
  _MeetingScreenState createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  @override
  Widget build(BuildContext context) {
    return GetX<MeetingController>(
      builder: (controller) {
        return Scaffold(
          floatingActionButton: PolicyBuilder(
            policy: Policy.manageMeetings,
            builder: (context, valid) {
              if (!valid) {
                return null;
              }

              return FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  Get.to(() => MeetingCreate());
                },
              );
            },
          ),
          body: FutureBuilder<List<Meeting>>(
            future: controller.get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.data.isEmpty) {
                return Center(
                  child: TitleText("No Upcoming Meetings"),
                );
              }

              return ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return MeetingPreview(
                    meeting: snapshot.data[index],
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
