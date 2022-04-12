import 'dart:async';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:first_priority_app/controllers/account.dart';
import 'package:first_priority_app/controllers/api.dart';
import 'package:first_priority_app/controllers/message.dart';
import 'package:first_priority_app/controllers/notification.dart';
import 'package:first_priority_app/controllers/school.dart';
import 'package:first_priority_app/meetings/controller/meeting_controller.dart';
import 'package:first_priority_app/meetings/controller/order_controller.dart';
import 'package:first_priority_app/models/notification.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:sembast/timestamp.dart';

class SplashController extends GetxController {
  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    'This channel is used for important notifications.', // description
    importance: Importance.max,
  );

  Future<void> initialize() async {
    await initializeFirebase();

    // Essential Controllers
    await Get.putAsync(() => Api.createInstance());
    Get.put(SchoolController());
    await Get.put(AccountController()).authenticate();
    Get.put(MeetingController());
    Get.put(OrderController());
    await Get.putAsync(() => NotificationStore.createInstance());

    // Non-essential Controllers
    Get.lazyPut(() => MessageController(), fenix: true);
  }

  Future<void> initializeFirebase() async {
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

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (Platform.isAndroid) {
        RemoteNotification notification = message.notification;
        AndroidNotification android = message.notification?.android;

        // If `onMessage` is triggered with a notification, construct our own
        // local notification to show to users using the created channel.
        if (notification != null && android != null) {
          flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                icon: "ic_stat_first_priority_full_icon_white",
                styleInformation: BigTextStyleInformation(''),
              ),
            ),
          );
        }
      }

      final controller = Get.find<NotificationStore>();
      controller.add(
        Notification(
          id: message.messageId,
          title: message.notification.title,
          body: message.notification.body,
          time: Timestamp.now(),
        ),
      );
    });
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  final store = await NotificationStore.createInstance();

  await store.add(
    Notification(
      id: message.messageId,
      title: message.notification.title,
      body: message.notification.body,
      time: Timestamp.now(),
    ),
  );

  print("Handling a background message: ${message.messageId}");
}
