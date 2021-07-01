import 'package:first_priority_app/meetings/controller/meeting_controller.dart';
import 'package:first_priority_app/meetings/meeting_create.dart';
import 'package:first_priority_app/meetings/meeting_preview.dart';
import 'package:first_priority_app/models/event.dart';
import 'package:first_priority_app/widgets/text/header_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeetingScreen extends StatelessWidget {
  final MeetingController _controller = Get.put(MeetingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(() => MeetingCreate());
        },
      ),
      body: Container(
        child: FutureBuilder<List<Meeting>>(
          future: _controller.get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.data.isEmpty) {
              return Center(
                child: HeaderText("No Upcoming Meetings"),
              );
            }

            return ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Container(
                  child: MeetingPreview(
                    meeting: snapshot.data[index],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
