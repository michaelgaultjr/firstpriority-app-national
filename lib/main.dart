import 'package:first_priority_app/Constants.dart';
import 'package:first_priority_app/controllers/account.dart';
import 'package:first_priority_app/controllers/core_api.dart';
import 'package:first_priority_app/resources/controllers/resources_controller.dart';
import 'package:first_priority_app/splash/SplashScreen.dart';
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
    injectDependencies();

    return GetMaterialApp(
      navigatorKey: mainNavigatorKey,
      debugShowCheckedModeBanner: false,
      title: "First Priority",
      theme: ThemeData(
        fontFamily: 'Schyler',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 2,
            primary: colorDarkBlue1,
            minimumSize: Size(double.infinity, 40),
            textStyle: TextStyle(
              fontFamily: fontSchylerRegular,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
        ),
      ),
      home: SplashScreen(),
    );
  }

  void injectDependencies() {
    Get.put(COREApi());
    Get.put(AccountController());
  }
}

// shape: MaterialStateProperty.all()
//             elevation: MaterialStateProperty.all(2),
//             backgroundColor: MaterialStateProperty.all(colorDarkBlue1),
//             minimumSize: MaterialStateProperty.all(Size(double.infinity, 40)),
//             textStyle: MaterialStateProperty.all(
//               TextStyle(
//                   fontFamily: fontSchylerRegular,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w700),
//             ),
