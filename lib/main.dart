import 'package:first_priority_app/signUp/SignUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(MyApp());
}

GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: mainNavigatorKey,
      debugShowCheckedModeBanner: false,
      title: "First Priority",
      home: SignUpScreen(),
    );
  }
}
