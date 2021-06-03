import 'package:first_priority_app/devotionals/devotionals_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/BottomDevotionalPart.dart';
import 'components/TopDevotionalPart.dart';

class DevotionalsScreen extends StatelessWidget {
  final DevotionalsController _devotionalsController =
      Get.put(DevotionalsController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TopDevotionalPart(),
        BottomDevotionalPart(),
      ],
    );
  }
}
