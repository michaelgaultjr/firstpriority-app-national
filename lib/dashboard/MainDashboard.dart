import 'package:first_priority_app/devotionals/devotionals_screen.dart';
import 'package:first_priority_app/meetings/meeting_screen.dart';
import 'package:first_priority_app/more/more_screen.dart';
import 'package:intl/intl.dart';
import 'controller/MainDashboardController.dart';
import 'package:first_priority_app/home/homeScreen/HomeScreen.dart';
import 'package:first_priority_app/resources/resources_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainDashBoard extends StatelessWidget {
  final MainDashboardController _mainDashboardController =
      Get.put(MainDashboardController());

  final _pageOptions = [
    HomeScreen(),
    MeetingScreen(),
    ResourcesScreen(),
    DevotionalsScreen(),
    MoreScreen(),
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
                        DateFormat('EEEE, MMMM d')
                            .format(DateTime.now())
                            .toUpperCase(),
                        style: Theme.of(context).textTheme.subtitle2,
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
        icon: Icon(
          Icons.home_outlined,
          size: 24,
        ),
        activeIcon: Icon(
          Icons.home_outlined,
          size: 32,
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.calendar_today_outlined,
          size: 24,
        ),
        activeIcon: Icon(
          Icons.calendar_today_outlined,
          size: 32,
        ),
        label: 'Meetings',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.menu_book_outlined,
          size: 24,
        ),
        activeIcon: Icon(
          Icons.menu_book_outlined,
          size: 32,
        ),
        label: 'Resources',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.book_outlined,
          size: 24,
        ),
        activeIcon: Icon(
          Icons.book_outlined,
          size: 32,
        ),
        label: 'Devotionals',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.more_horiz,
          size: 24,
        ),
        activeIcon: Icon(
          Icons.more_horiz,
          size: 32,
        ),
        label: 'More',
      )
    ];
  }
}
