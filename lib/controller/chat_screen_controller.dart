import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreenController extends GetxController {
  ChatScreenController({this.loggedInUser, this.chatId, this.receiverId});
  final String? chatId, receiverId;
  final User? loggedInUser;

  String? receiverToken;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController messageTextController = TextEditingController();
  Stream<QuerySnapshot<Object?>>? stream;
  String? messageString;

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

      FirebaseMessaging.instance.sendMessage(
        to: receiverToken ?? 'test@fcm.googleapis.com',
        // data: {
        //   'title': 'Message',
        //   'text': 'hello',
        // },
      );
    } on FirebaseException catch (ex) {
      print('FirebaseException');
    } catch (e) {
      print('hhhhhhhhhhhhhhhhhhh');
      print(e);
    }
  }

  onCallTap() => Get.toNamed('/voiceCallScreen');
}
