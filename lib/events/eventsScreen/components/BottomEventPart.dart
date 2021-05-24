import 'package:first_priority_app/events/controller/EventsController.dart';
import 'package:first_priority_app/events/event_details/EventsDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants.dart';

class BottomEventPart extends StatelessWidget {
  final EventsController _eventsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 8),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: _eventsController.titles.length,
          itemBuilder: (context, index) {
            return Container(
              child: GestureDetector(
                onTap: () {
                  Get.to(() => EventsDetails());
                },
                child: ListTile(
                  title: Text(
                    _eventsController.titles[index],
                    style: getCustomTextProperties(
                        Colors.black, 16, fontSchylerRegular, 1),
                  ),
                  subtitle: Text(
                    _eventsController.subtitles[index],
                    style: getCustomTextProperties(
                        colorLightDark, 14, "Schyler", 0),
                  ),
                  leading: Container(
                    margin: EdgeInsets.only(left: 10),
                    alignment: Alignment.centerRight,
                    height: 60,
                    width: 70,
                    child: Material(
                      borderRadius: BorderRadius.circular(5.0),
                      shadowColor: Colors.black12,
                      color: Colors.black12,
                      elevation: 7.0,
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'SEP',
                              style: getCustomTextProperties(
                                  Colors.black, 14, "Schyler", 1),
                            ),
                            Text(
                              '29',
                              style: getCustomTextProperties(
                                  Colors.black, 24, "Schyler", 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
