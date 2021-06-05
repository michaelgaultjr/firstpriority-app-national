import 'package:first_priority_app/Constants.dart';
import 'package:first_priority_app/devotionals/devotionalsScreen/DevotionalsScreen.dart';
import 'controller/MainDashboardController.dart';
import 'package:first_priority_app/events/eventsScreen/EventsScreen.dart';
import 'package:first_priority_app/home/homeScreen/HomeScreen.dart';
import 'package:first_priority_app/profile/ProfileScreen.dart';
import 'package:first_priority_app/resources/resourcesScreen/ResourcesScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MainDashBoard extends StatelessWidget {
  final MainDashboardController _mainDashboardController =
      Get.put(MainDashboardController());

  final _pageOptions = [
    HomeScreen(),
    EventsScreen(),
    ResourcesScreen(),
    DevotionalsScreen(),
    ProfileScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: _pageOptions[_mainDashboardController.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
            items: _items,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: colorSelectedBottom,
            unselectedItemColor: Colors.black12,
            iconSize: 40,
            backgroundColor: Colors.white,
            onTap: (index) {
              _mainDashboardController.currentIndex.value = index;
            },
            currentIndex: _mainDashboardController.currentIndex.value,
            elevation: 5),
      ),
    );
  }

  final _items = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/svgimages/home.svg',
        height: iconSizes,
        width: iconSizes,
      ),
      title: Text(
        'Home',
        style: TextStyle(
          fontSize: textSizes,
        ),
      ),
      activeIcon: SvgPicture.asset(
        'assets/svgimages/home.svg',
        height: iconSizes,
        width: iconSizes,
        color: colorSelectedBottom,
      ),
    ),
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
        style: TextStyle(
          fontSize: textSizes,
        ),
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
        style: TextStyle(
          fontSize: textSizes,
        ),
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
        style: TextStyle(
          fontSize: textSizes,
        ),
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
        style: TextStyle(
          fontSize: textSizes,
        ),
      ),
    )
  ];
}
