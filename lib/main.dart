import 'package:first_priority_app/notifiers/theme_notifier.dart';
import 'package:first_priority_app/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(),
      child: MyApp(),
    ),
  );
}

GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, _) => GetMaterialApp(
        navigatorKey: mainNavigatorKey,
        debugShowCheckedModeBanner: false,
        title: "First Priority",
        theme: theme.current,
        home: SplashScreen(),
      ),
    );
  }
}
