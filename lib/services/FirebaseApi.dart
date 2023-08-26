import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:telead_e_learning/constants/constant.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  final _androidChanel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications',
    importance: Importance.high,
    playSound: true,
  );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    Get.toNamed('/chatScreen',
        arguments: [message.data['chatId'], currentUser]);
  }

  Future initPushNotifications() async {
    FirebaseMessaging.instance.getInitialMessage().then(
        handleMessage); //responsible for performing an action through notification when application is in terminated state
    FirebaseMessaging.onMessageOpenedApp.listen(
        handleMessage); // responsible for performing an action through notification when app is in background state
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _androidChanel.id,
            _androidChanel.name,
            channelDescription: _androidChanel.description,
            icon: '@drawable/launch_background',
          ),
        ),
        payload: jsonEncode(message.toMap()),
      );
    });
  }

  Future initLocalNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    ); //for ios
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_androidChanel);

    const iOS = DarwinInitializationSettings();
    const android =
        AndroidInitializationSettings('@drawable/launch_background');
    const settings = InitializationSettings(android: android, iOS: iOS);

    await flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (payload) {
        // final message = RemoteMessage.fromMap(jsonDecode(payload.toString()));
        // handleMessage(message);
      },
    );
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                _androidChanel.id,
                _androidChanel.name,
                channelDescription: _androidChanel.description,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
                showWhen: true,
              ),
            ));
      }
    });
  }

  Future<void> handleBackgroundMessage(RemoteMessage message) async {}

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    fcmToken = await _firebaseMessaging.getToken();
    initPushNotifications();
    initLocalNotifications();
  }
}
