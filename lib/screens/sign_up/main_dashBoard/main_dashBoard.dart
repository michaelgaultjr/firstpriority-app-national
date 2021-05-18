import 'package:custom_navigator/custom_navigation.dart';
import 'package:custom_navigator/custom_scaffold.dart';
import 'package:first_priority_app/Constants.dart';
import 'package:first_priority_app/screens/sign_up/main_dashBoard/churches/churches_screen.dart';
import 'package:first_priority_app/screens/sign_up/main_dashBoard/devotionals/devotionals_screen.dart';
import 'package:first_priority_app/screens/sign_up/main_dashBoard/events/events_details.dart';
import 'package:first_priority_app/screens/sign_up/main_dashBoard/events/events_screen.dart';
import 'package:first_priority_app/screens/sign_up/main_dashBoard/resources/resources_detail_screen.dart';
import 'package:first_priority_app/screens/sign_up/main_dashBoard/resources/resources_screen.dart';

import 'package:first_priority_app/screens/sign_up/profile/profile_screen.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class MainDashBoard extends StatefulWidget {
  final String title;

  MainDashBoard({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainDashBoard();
  }
}

class _MainDashBoard extends State<MainDashBoard> {
  int _currentIndex = 0;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final _pageOptions = [
    HomeScreen(),
    EventsDetails(),
    ResourcesDetails(),
    // ChurchesScreen(),
    DevotionalsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        scaffold: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              items: _items,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: colorSelectedBottom,
              unselectedItemColor: Colors.black12,
              iconSize: 40,
              backgroundColor: Colors.white,
              onTap: (index) {
                navigatorKey.currentState.maybePop();
                setState(() {
                  _pageOptions[index];
                });
                _currentIndex = index;
              },
              currentIndex: _currentIndex,
              elevation: 5),
        ),
        children: <Widget>[
          HomeScreen(),
          EventsScreen(),
          ResourcesScreen(),
          // ChurchesScreen(),
          DevotionalsScreen(),
          ProfileScreen(),
        ],

        // Called when one of the [items] is tapped.
        onItemTap: (index) {});
  }

  final _items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined, size: 30),
      title: Text('Home'),
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.event_outlined, size: 30), title: Text('Events')),
    BottomNavigationBarItem(
      icon: Image.asset("assets/images/resources.jpg"),
      title: Text('Resources'),
    ),
    // BottomNavigationBarItem(
    //     icon: Icon(Icons.home, size: 30), title: Text('Churches')),
    BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border, size: 30),
        title: Text('Devotionals')),
    BottomNavigationBarItem(
        icon: Icon(Icons.contacts_outlined, size: 30), title: Text('Profile'))
  ];
}
