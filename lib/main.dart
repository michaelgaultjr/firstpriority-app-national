import 'package:first_priority_app/Constants.dart';
import 'package:first_priority_app/splash/splash_screen.dart';
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
      // themeMode: ThemeMode.light,
      darkTheme: buildTheme(
        accentColor: colorSelectedBottom,
        secondaryColor: Colors.white12,
        backgroundColor: Color.fromARGB(255, 25, 25, 25),
        cardBackgroundColor: Color.fromARGB(255, 40, 40, 40),
        bodyText1: TextStyle(color: Colors.white, fontSize: 16),
        headline1:
            getCustomTextProperties(Colors.white, 30, fontSchylerRegular, 1),
        subtitle1:
            getCustomTextProperties(Colors.white54, 16, fontSchylerRegular, 1),
        headline3:
            getCustomTextProperties(Colors.white, 16, fontSchylerRegular, 1),
        headline4:
            getCustomTextProperties(Colors.white54, 14, fontSchylerRegular, 0),
        bodyText2: TextStyle(color: Colors.white70),
        navBackgroundColor: Color.fromARGB(255, 27, 27, 27),
        navUnselectedColor: Colors.white54,
        dividerColor: Colors.white24,
      ),
      theme: buildTheme(
        accentColor: colorSelectedBottom,
        secondaryColor: Colors.black12,
        backgroundColor: Colors.white,
        cardBackgroundColor: Colors.white,
        headline1:
            getCustomTextProperties(Colors.black, 30, fontSchylerRegular, 1),
        subtitle1:
            getCustomTextProperties(Colors.black54, 16, fontSchylerRegular, 1),
        headline4:
            getCustomTextProperties(colorLightDark, 14, fontSchylerRegular, 0),
        headline3:
            getCustomTextProperties(Colors.black, 16, fontSchylerRegular, 1),
        navBackgroundColor: Colors.white,
        navUnselectedColor: Colors.black12,
      ),
      home: SplashScreen(),
    );
  }
}

ThemeData buildTheme({
  Color backgroundColor,
  Color cardBackgroundColor,
  Color secondaryColor,
  TextStyle headline1,
  TextStyle headline3,
  TextStyle headline4,
  TextStyle subtitle1,
  TextStyle bodyText1,
  TextStyle bodyText2,
  Color accentColor,
  Color navBackgroundColor,
  Color navUnselectedColor,
  Color dividerColor,
}) {
  return ThemeData(
    fontFamily: 'Schyler',
    backgroundColor: backgroundColor,
    scaffoldBackgroundColor: backgroundColor,
    accentColor: accentColor,
    secondaryHeaderColor: secondaryColor,
    textTheme: TextTheme(
      headline1: headline1,
      headline3: headline3,
      headline4: headline4,
      bodyText2: bodyText2,
      subtitle1: subtitle1,
      bodyText1: bodyText1,
    ),
    cardTheme: CardTheme(
      color: cardBackgroundColor,
      elevation: 5,
    ),
    dividerColor: dividerColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 5,
        primary: colorDarkBlue1,
        minimumSize: Size(double.infinity, 40),
        textStyle: TextStyle(
          fontFamily: fontSchylerRegular,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 5,
      backgroundColor: navBackgroundColor,
      unselectedItemColor: navUnselectedColor,
      selectedItemColor: accentColor,
    ),
  );
}
