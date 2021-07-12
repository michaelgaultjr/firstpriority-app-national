import 'package:first_priority_app/home/homeScreen/components/upcoming_event_card.dart';
import 'package:first_priority_app/home/homeScreen/components/devotional_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DevotionalCard(),
            UpcomingEventCard(),
          ],
        ),
      ),
    );
  }
}
