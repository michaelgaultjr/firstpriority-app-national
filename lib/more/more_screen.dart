import 'package:first_priority_app/more/account/account_screen.dart';
import 'package:first_priority_app/more/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreItem {
  final String name;
  final Widget screen;
  final Icon icon;
  final String url;

  MoreItem({this.name, this.icon, this.screen, this.url});
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
    MoreItem(
      name: "Website",
      icon: Icon(Icons.public),
      url: "https://firstpriority.cc",
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
              onTap: () async {
                if (_screens[index].url != null) {
                  await canLaunch(_screens[index].url)
                      ? await launch(_screens[index].url)
                      : ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Could not launch ${_screens[index].url}'),
                          ),
                        );
                } else {
                  Get.to(() => _screens[index].screen);
                }
              });
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}
