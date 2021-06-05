import 'package:flutter/material.dart';

import 'components/BottomNewEventPart.dart';
import 'components/TopNewEventPart.dart';

class NewEventView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopNewEventPart(),
            BottomNewEventPart(),
          ],
        ),
      ),
    );
  }
}
