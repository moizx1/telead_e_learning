import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreenController extends GetxController {
  ChatScreenController({this.loggedInUser, this.chatId});
  final String? chatId;
  final User? loggedInUser;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController messageTextController = TextEditingController();
  Stream<QuerySnapshot<Object?>>? stream;
  String? messageString;

  @override
  void onInit() {
    stream = firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('time', descending: true)
        .snapshots();
    super.onInit();
  }

  onSendPress() async {
    messageString = messageTextController.text;
    messageTextController.clear();

    await firestore.collection('chats').doc(chatId).collection('messages').add(
      {
        'chatId': chatId,
        'message': messageString,
        'sender': loggedInUser?.email,
        'time': DateTime.now()
      },
    ).then((_) async {
      await firestore.collection('chats').doc(chatId).update(
        {
          'lastMessage': messageString,
          'time': DateTime.now(),
        },
      );
    });
  }

  onCallTap() => Get.toNamed('/voiceCallScreen');
}
