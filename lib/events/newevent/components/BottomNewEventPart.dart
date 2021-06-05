import 'package:first_priority_app/events/controller/EventsController.dart';
import 'package:first_priority_app/events/eventsScreen/EventsScreen.dart';
import 'package:first_priority_app/events/newevent/subComponent/AudioMultiSelectDialog.dart';
import 'package:first_priority_app/events/newevent/subComponent/DiscusionMultiSelectDialog.dart';
import 'package:first_priority_app/events/newevent/subComponent/FoodMultiSelectDialog.dart';
import 'package:first_priority_app/events/newevent/subComponent/GameMultiSelectDialog.dart';
import 'package:first_priority_app/events/newevent/subComponent/GreetersMultiSelectDialog.dart';
import 'package:first_priority_app/events/newevent/subComponent/PrayerMultiSelectDialog.dart';
import 'package:first_priority_app/events/newevent/subComponent/PromotionsMultiSelectDialog.dart';
import 'package:first_priority_app/events/newevent/subComponent/SetupMultiSelectDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants.dart';

class BottomNewEventPart extends StatelessWidget {
  final EventsController _eventsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15.0,
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              'Roles',
              style: getCustomTextProperties(
                  Colors.black, 30, fontSchylerRegular, 1),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          DiscussionMultiSelectDialog(),
          SizedBox(
            height: 19,
          ),
          PrayerMultiSelectDialog(),
          SizedBox(
            height: 19,
          ),
          GameMultiSelectDialog(),
          SizedBox(
            height: 19,
          ),
          GreetersMultiSelectDialog(),
          SizedBox(
            height: 19,
          ),
          PromotionsMultiSelectDialog(),
          SizedBox(
            height: 19,
          ),
          SetUpMultiSelectDialog(),
          SizedBox(
            height: 19,
          ),
          AudioMultiSelectDialog(),
          SizedBox(
            height: 19,
          ),
          FoodMultiSelectDialog(),
          SizedBox(
            height: 19,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            width: Get.width,
            child: TextButton(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                child: Wrap(
                  children: [
                    Text(
                      'Schedule Event',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: fontSchylerRegular,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              style: textButtonUpdateRouteStyle,
              onPressed: () {
                Get.back();
                },
            ),
          ),
          SizedBox(
            height: 19,
          ),
        ],
      ),
    );
  }
}
