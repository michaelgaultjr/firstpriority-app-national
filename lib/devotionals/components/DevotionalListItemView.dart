import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_priority_app/Constants.dart';
import 'package:first_priority_app/devotionals/devotionals_details.dart';
import 'package:first_priority_app/models/devotional.dart';
import 'package:first_priority_app/widgets/pill_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DevotionalListItemView extends StatelessWidget {
  final Devotional devotional;
  final DateFormat dateFormat = DateFormat('MMM d');

  DevotionalListItemView({@required this.devotional});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image(
              image: CachedNetworkImageProvider(devotional.contentUrl),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            elevation: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      devotional.title,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                        "${dateFormat.format(devotional.startDate)} - ${dateFormat.format(devotional.endDate)}")
                  ],
                ),
                PillButton(
                  child: Text(
                    'READ',
                    style: TextStyle(
                      color: colorDarkBlue1,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  onTap: () {
                    Get.to(
                      () => DevotionalsDetailsScreen(
                        devotional: devotional,
                      ),
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
