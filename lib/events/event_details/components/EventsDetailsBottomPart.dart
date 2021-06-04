import 'package:first_priority_app/events/controller/EventsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants.dart';

class EventsDetailsBottomPart extends StatelessWidget {
  final EventsController _eventsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Text(
              _eventsController.eventDetailsDescription.value,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Roles',
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            _eventsController.detailsRoleList[0].title,
            style: getCustomTextProperties(
                Colors.black, 16, fontSchylerRegular, 0),
          ),
          Text(
            _eventsController.detailsRoleList[0].subTitle,
            style: getCustomTextProperties(colorLightDark, 14, "Schyler", 0),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            _eventsController.detailsRoleList[1].title,
            style: getCustomTextProperties(
                Colors.black, 16, fontSchylerRegular, 0),
          ),
          Text(
            _eventsController.detailsRoleList[1].subTitle,
            style: getCustomTextProperties(colorLightDark, 14, "Schyler", 0),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            _eventsController.detailsRoleList[2].title,
            style: getCustomTextProperties(
                Colors.black, 16, fontSchylerRegular, 0),
          ),
          Text(
            _eventsController.detailsRoleList[2].subTitle,
            style: getCustomTextProperties(colorLightDark, 14, "Schyler", 0),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            _eventsController.detailsRoleList[3].title,
            style: getCustomTextProperties(
                Colors.black, 16, fontSchylerRegular, 0),
          ),
          Text(
            _eventsController.detailsRoleList[3].subTitle,
            style: getCustomTextProperties(colorLightDark, 14, "Schyler", 0),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            _eventsController.detailsRoleList[4].title,
            style: getCustomTextProperties(
                Colors.black, 16, fontSchylerRegular, 0),
          ),
          Text(
            _eventsController.detailsRoleList[4].subTitle,
            style: getCustomTextProperties(colorLightDark, 14, "Schyler", 0),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            _eventsController.detailsRoleList[5].title,
            style: getCustomTextProperties(
                Colors.black, 16, fontSchylerRegular, 0),
          ),
          Text(
            _eventsController.detailsRoleList[5].subTitle,
            style: getCustomTextProperties(colorLightDark, 14, "Schyler", 0),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            _eventsController.detailsRoleList[6].title,
            style: getCustomTextProperties(
                Colors.black, 16, fontSchylerRegular, 0),
          ),
          Text(
            _eventsController.detailsRoleList[6].subTitle,
            style: getCustomTextProperties(colorLightDark, 14, "Schyler", 0),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
