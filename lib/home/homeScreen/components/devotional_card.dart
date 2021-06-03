import 'package:first_priority_app/devotionals/components/DevotionalListItemView.dart';
import 'package:first_priority_app/devotionals/devotionals_controller.dart';
import 'package:first_priority_app/models/devotional.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      },
    );
  }
}
