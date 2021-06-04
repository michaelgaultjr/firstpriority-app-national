import 'package:first_priority_app/Constants.dart';
import 'package:first_priority_app/devotionals/devotionals_screen.dart';
import 'controller/MainDashboardController.dart';
import 'package:first_priority_app/events/events_screen.dart';
import 'package:first_priority_app/home/homeScreen/HomeScreen.dart';
import 'package:first_priority_app/profile/ProfileScreen.dart';
import 'package:first_priority_app/resources/resources_screen.dart';
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
    final _items = buildItems(context);
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        'MONDAY, SEPTEMBER 27',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                    Container(
                      child: Text(
                        _items[_mainDashboardController.currentIndex.value]
                            .label,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child:
                    _pageOptions[_mainDashboardController.currentIndex.value],
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: _items,
          type: BottomNavigationBarType.fixed,
          iconSize: 40,
          onTap: (index) {
            _mainDashboardController.currentIndex.value = index;
          },
          currentIndex: _mainDashboardController.currentIndex.value,
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> buildItems(BuildContext context) {
    return [
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/svgimages/home.svg',
          height: iconSizes,
          width: iconSizes,
        ),
        label: 'Home',
        activeIcon: SvgPicture.asset(
          'assets/svgimages/home.svg',
          height: iconSizes,
          width: iconSizes,
          color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        ),
      ),
      BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/svgimages/events.svg',
              height: iconSizes, width: iconSizes),
          activeIcon: SvgPicture.asset(
            'assets/svgimages/events.svg',
            height: iconSizes,
            width: iconSizes,
            color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          ),
          label: 'Events'),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/svgimages/message.svg',
          height: iconSizes,
          width: iconSizes,
        ),
        activeIcon: SvgPicture.asset(
          'assets/svgimages/message.svg',
          height: iconSizes,
          width: iconSizes,
          color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        ),
        label: 'Resources',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/svgimages/bookmark.svg',
          height: iconSizes,
          width: iconSizes,
        ),
        activeIcon: SvgPicture.asset(
          'assets/svgimages/bookmark.svg',
          height: iconSizes,
          width: iconSizes,
          color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        ),
        label: 'Devotionals',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/svgimages/profile.svg',
          height: iconSizes,
          width: iconSizes,
        ),
        activeIcon: SvgPicture.asset(
          'assets/svgimages/profile.svg',
          height: iconSizes,
          width: iconSizes,
          color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        ),
        label: 'Profile',
      )
    ];
  }
}
