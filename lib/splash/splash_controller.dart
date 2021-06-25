import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:first_priority_app/controllers/account.dart';
import 'package:first_priority_app/controllers/api.dart';
import 'package:first_priority_app/controllers/school.dart';
import 'package:first_priority_app/models/user.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  Future<void> initialize() async {
    await Get.putAsync(() => Api.createInstance());
    final authenticationResult =
        await Get.put(AccountController()).authenticate();
    Get.lazyPut(() => SchoolController(), fenix: true);

    await initializeFirebase(authenticationResult.user);
  }

  Future<void> initializeFirebase(User user) async {
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance.subscribeToTopic("school_${user.schoolId}");
    FirebaseMessaging.instance.subscribeToTopic("region_${user.regionId}");
    FirebaseMessaging.instance.subscribeToTopic("user_${user.id}");
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}
