import 'package:custom_navigator/custom_navigation.dart';
import 'package:custom_navigator/custom_scaffold.dart';
import 'package:first_priority_app/Constants.dart';
import 'package:first_priority_app/devotionals/devotionals_screen.dart';
import 'package:first_priority_app/event_details/events_details.dart';
import 'package:first_priority_app/events/events_screen.dart';
import 'package:first_priority_app/home/home_screen.dart';
import 'package:first_priority_app/profile/profile_screen.dart';
import 'package:first_priority_app/resources/resources_screen.dart';
import 'package:first_priority_app/resources_details/resources_detail_screen.dart';
import 'package:first_priority_app/schools/SchoolsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    // SchoolsScreen(),
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
          // SchoolsScreen(),
          ProfileScreen(),
        ],

        // Called when one of the [items] is tapped.
        onItemTap: (index) {});
  }

  final _items = [
    BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/svgimages/home.svg',
          height: iconSizes,
          width: iconSizes,
        ),
        title: Text('Home', style: TextStyle(fontSize: textSizes,)),
        activeIcon: SvgPicture.asset(
          'assets/svgimages/home.svg',
          height: iconSizes,
          width: iconSizes,
          color: colorSelectedBottom,
        )),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/svgimages/events.svg',
          height: iconSizes, width: iconSizes),
      activeIcon: SvgPicture.asset(
        'assets/svgimages/events.svg',
        height: iconSizes,
        width: iconSizes,
        color: colorSelectedBottom,
      ),
      title: Text(
        'Events',
        style: TextStyle(fontSize: textSizes,),
      ),
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/svgimages/message.svg',
          height: iconSizes, width: iconSizes),
      activeIcon: SvgPicture.asset(
        'assets/svgimages/message.svg',
        height: iconSizes,
        width: iconSizes,
        color: colorSelectedBottom,
      ),
      title: Text(
        'Resources',
        style: TextStyle(fontSize: textSizes,),
      ),
    ),
    // BottomNavigationBarItem(
    //     icon: Icon(Icons.home, size: 30), title: Text('Churches')),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/svgimages/bookmark.svg',
          height: iconSizes, width: iconSizes),
      activeIcon: SvgPicture.asset(
        'assets/svgimages/bookmark.svg',
        height: iconSizes,
        width: iconSizes,
        color: colorSelectedBottom,
      ),
      title: Text(
        'Devotionals',
        style: TextStyle(fontSize: textSizes,),
      ),
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/svgimages/profile.svg',
          height: iconSizes, width: iconSizes),
      activeIcon: SvgPicture.asset(
        'assets/svgimages/profile.svg',
        height: iconSizes,
        width: iconSizes,
        color: colorSelectedBottom,
      ),
      title: Text(
        'Profile',
        style: TextStyle(fontSize: textSizes,),
      ),
    )

  ];
}
