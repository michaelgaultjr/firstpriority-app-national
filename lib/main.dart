import 'package:first_priority_app/Constants.dart';
import 'package:first_priority_app/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      themeMode: ThemeMode.light,
      darkTheme: buildTheme(
        colorScheme: ColorScheme.dark(
          primary: Color.fromARGB(255, 0, 33, 91),
          primaryVariant: Color.fromARGB(255, 0, 22, 61),
          secondary: Color.fromARGB(255, 178, 8, 56),
          secondaryVariant: Color.fromARGB(255, 157, 7, 49),
          surface: Color.fromARGB(255, 40, 40, 40),
          background: Color.fromARGB(255, 25, 25, 25),
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.white,
          onBackground: Colors.white,
          onError: Colors.white,
        ),
        accentColor: colorSelectedBottom,
        surfaceBright: Colors.white12,
        bodyText1: TextStyle(color: Colors.white, fontSize: 16),
        headline1:
            getCustomTextProperties(Colors.white, 30, fontSchylerRegular, 1),
        defaultText: TextStyle(color: Colors.white),
        subtitle2:
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
        colorScheme: ColorScheme.light(
          primary: Color.fromARGB(255, 0, 33, 91),
          primaryVariant: Color.fromARGB(255, 0, 22, 61),
          secondary: Color.fromARGB(255, 178, 8, 56),
          secondaryVariant: Color.fromARGB(255, 157, 7, 49),
          surface: Colors.white,
          background: Colors.white,
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black,
          onBackground: Colors.black,
          onError: Colors.white,
        ),
        accentColor: colorSelectedBottom,
        surfaceBright: Colors.black12,
        headline1:
            getCustomTextProperties(Colors.black, 30, fontSchylerRegular, 1),
        defaultText: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        subtitle2:
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
  ColorScheme colorScheme,
  Color surfaceBright,
  TextStyle headline1,
  TextStyle headline3,
  TextStyle headline4,
  TextStyle defaultText,
  TextStyle subtitle2,
  TextStyle bodyText1,
  TextStyle bodyText2,
  Color accentColor,
  Color navBackgroundColor,
  Color navUnselectedColor,
  Color dividerColor,
}) {
  return ThemeData(
    fontFamily: 'Schyler',
    backgroundColor: colorScheme.background,
    scaffoldBackgroundColor: colorScheme.background,
    accentColor: accentColor,
    secondaryHeaderColor: surfaceBright,
    colorScheme: colorScheme,
    textTheme: TextTheme(
      headline1: headline1,
      headline3: headline3,
      headline4: headline4,
      bodyText2: bodyText2,
      subtitle1: defaultText,
      subtitle2: subtitle2,
      bodyText1: bodyText1,
    ),
    cardTheme: CardTheme(
      elevation: 2,
      color: colorScheme.surface,
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: colorScheme.onBackground,
      ),
      contentPadding: EdgeInsets.all(4),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: colorScheme.secondary),
      ),
    ),
    textSelectionTheme:
        TextSelectionThemeData(cursorColor: colorScheme.secondaryVariant),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colorScheme.primary,
    ),
    canvasColor: colorScheme.surface,
    dividerColor: dividerColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 2,
        primary: colorScheme.primary,
        minimumSize: Size(double.infinity, 40),
        textStyle: TextStyle(
          fontFamily: fontSchylerRegular,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: colorScheme.onPrimary,
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 2,
      backgroundColor: colorScheme.background,
      unselectedItemColor: navUnselectedColor,
      selectedItemColor: colorScheme.secondary,
    ),
  );
}
