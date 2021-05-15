import 'package:first_priority_app/screens/sign_up/main_dashBoard/churches/churches_screen.dart';
import 'package:first_priority_app/screens/sign_up/main_dashBoard/devotionals/devotionals_screen.dart';
import 'package:first_priority_app/screens/sign_up/main_dashBoard/events/events_screen.dart';
import 'package:first_priority_app/screens/sign_up/main_dashBoard/resources/resources_screen.dart';
import 'package:first_priority_app/screens/sign_up/profile/profile_screen.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class MainDashBoard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainDashBoard();
  }
}

class _MainDashBoard extends State<MainDashBoard> {
  int selectedPage = 0;

  final _pageOptions = [
    HomeScreen(),
    EventsScreen(),
    ResourcesScreen(),
    ChurchesScreen(),
    DevotionalsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pageOptions[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedPage,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: 30),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.event_outlined, size: 30),
                title: Text('Events')),
            BottomNavigationBarItem(
                icon: Icon(Icons.book, size: 30), title: Text('Resources')),
            BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 30), title: Text('Churches')),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border, size: 30),
                title: Text('Devotionals')),
            BottomNavigationBarItem(
                icon: Icon(Icons.contacts_outlined, size: 30),
                title: Text('Profile'))
          ],
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.indigo,
          unselectedItemColor: Colors.black12,
          iconSize: 40,
          backgroundColor: Colors.white,
          onTap: (index) {
            setState(() {
              selectedPage = index;
            });
          },
          elevation: 5),
    );
  }
}
