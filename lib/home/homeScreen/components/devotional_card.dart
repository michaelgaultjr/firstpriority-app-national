import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_priority_app/devotionals/components/DevotionalListItemView.dart';
import 'package:first_priority_app/devotionals/devotionals_controller.dart';
import 'package:first_priority_app/devotionals/devotionals_details.dart';
import 'package:first_priority_app/models/devotional.dart';
import 'package:first_priority_app/widgets/pill_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants.dart';

class DevotionalCard extends StatelessWidget {
  final DevotionalsController _controller = Get.find<DevotionalsController>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Devotional>(
      future: _controller.getToday(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return DevotionalListItemView(devotional: snapshot.data);
        // return Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Stack(
        //       children: [
        //         Container(
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.vertical(
        //               top: Radius.circular(20.0),
        //             ),
        //           ),
        //           child: Card(
        //             semanticContainer: true,
        //             clipBehavior: Clip.antiAliasWithSaveLayer,
        //             child: Image(
        //               image:
        //                   CachedNetworkImageProvider(snapshot.data.contentUrl),
        //               fit: BoxFit.fill,
        //             ),
        //             shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(8),
        //             ),
        //             elevation: 5,
        //           ),
        //         ),
        //       ],
        //     ),
        //     SizedBox(
        //       height: 10.0,
        //     ),
        //     Container(
        //       margin: EdgeInsets.only(right: 5),
        //       width: Get.width,
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Column(
        //             mainAxisAlignment: MainAxisAlignment.start,
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Container(
        //                 margin: EdgeInsets.only(left: 15),
        //                 child: Text(
        //                   'Read the Devotional',
        //                   style: getCustomTextProperties(
        //                       Colors.black, 16, fontSchylerRegular, 1),
        //                 ),
        //               ),
        //               Container(
        //                 margin: EdgeInsets.only(top: 4.0, left: 15),
        //                 child: Text(
        //                   'Connect with God Daily.',
        //                   style: getCustomTextProperties(
        //                       colorDarkGray, 11, fontSchylerRegular, 0),
        //                 ),
        //               ),
        //             ],
        //           ),
        //           PillButton(
        //             child: Text(
        //               'READ',
        //               style: TextStyle(
        //                 color: colorDarkBlue1,
        //                 fontWeight: FontWeight.bold,
        //                 fontSize: 14,
        //               ),
        //             ),
        //             onTap: () {
        //               Get.to(
        //                 () => DevotionalsDetailsScreen(
        //                   devotional: snapshot.data,
        //                 ),
        //               );
        //             },
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // );
      },
    );
  }
}
