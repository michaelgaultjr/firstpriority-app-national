import 'package:first_priority_app/devotionals/devotionals_controller.dart';
import 'package:first_priority_app/devotionals/devotionals_details.dart';
import 'package:first_priority_app/devotionals/components/DevotionalListItemView.dart';
import 'package:first_priority_app/models/devotional.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomDevotionalPart extends StatelessWidget {
  final DevotionalsController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: FutureBuilder<List<Devotional>>(
          future: _controller.get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: (BuildContext ctx, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 6),
                  child: DevotionalListItemView(
                    devotional: snapshot.data[index],
                  ),
                );
              },
              itemCount: snapshot.data.length,
            );
          },
        ),
      ),
    );
  }
}
