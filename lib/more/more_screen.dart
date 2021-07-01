import 'package:first_priority_app/more/account/account_screen.dart';
import 'package:first_priority_app/more/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoreItem {
  final String name;
  final Widget screen;
  final Icon icon;

  MoreItem({this.name, this.icon, this.screen});
}

class MoreScreen extends StatelessWidget {
  MoreScreen({Key key}) : super(key: key);

  final _screens = [
    MoreItem(
      name: "Settings",
      icon: Icon(Icons.settings),
      screen: SettingsScreen(),
    ),
    MoreItem(
      name: "Account",
      icon: Icon(Icons.person),
      screen: AccountScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: _screens.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: _screens[index].icon,
            title: Text(_screens[index].name),
            onTap: () => Get.to(() => _screens[index].screen),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}
