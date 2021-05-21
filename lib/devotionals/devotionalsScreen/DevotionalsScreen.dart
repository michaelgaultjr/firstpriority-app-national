import 'package:first_priority_app/devotionals/controller/DevotionalsController.dart';
import 'package:first_priority_app/devotionals/devotionalsScreen/components/BottomDevotionalPart.dart';
import 'package:first_priority_app/devotionals/devotionalsScreen/components/TopDevotionalPart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DevotionalsScreen extends StatelessWidget {
  final DevotionalsController _devotionalsController =
      Get.put(DevotionalsController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TopDevotionalPart(),
        BottomDevotionalPart(),
      ],
    );
  }
}
