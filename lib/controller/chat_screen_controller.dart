import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_keys.dart';

class ChatScreenController extends GetxController {
  ChatScreenController({this.loggedInUser, this.chatId, this.receiverId});
  final String? chatId, receiverId;
  final User? loggedInUser;

  late String receiverToken;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController messageTextController = TextEditingController();
  Stream<QuerySnapshot<Object?>>? stream;
  late String messageString;

  @override
  void onInit() async {
    stream = firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('time', descending: true)
        .snapshots();
    final result = await firestore.collection('users').doc(receiverId).get();
    receiverToken = result['fcmToken'];
    print(receiverToken);
    super.onInit();
  }

  onSendPress() async {
    messageString = messageTextController.text;
    messageTextController.clear();
    try {
      await firestore
          .collection('chats')
          .doc(chatId)
          .collection('messages')
          .add(
        {
          'chatId': chatId,
          'message': messageString,
          'sender': loggedInUser?.email,
          'time': DateTime.now()
        },
      );
      await firestore.collection('chats').doc(chatId).update(
        {
          'lastMessage': messageString,
          'time': DateTime.now(),
        },
      );
      print('Collection added');

      await sendNotification(messageString, receiverToken);
    } on FirebaseException catch (ex) {
      print(ex);
    } catch (e) {
      print(e);
    }
  }

  Future<void> sendNotification(String body, String recipientToken) async {
    // Create the Firebase Cloud Messaging (FCM) request.
    Map<String, dynamic> request = {
      'notification': {
        'body': body,
        'title': 'New Message',
      },
      'data': {
        'click_action': 'FLUTTER_NOTIFICATION_CLICK',
      },
      'to': recipientToken,
    };

    // Send the request to the FCM REST API.
    await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=${AppKeys.serverKey}',
      },
      body: jsonEncode(request),
    );
  }

  onCallTap() => Get.toNamed('/voiceCallScreen');
}
