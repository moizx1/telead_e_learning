import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreenController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController messageTextController = TextEditingController();
  late User loggedInUser;

  @override
  void onInit() async {
    getCurrentUser();
    super.onInit();
  }

  onSendPress() {
    print(messageTextController.text);
    if (messageTextController != null) {
      firestore.collection('messages').add(
        {
          'message': messageTextController.text,
          'sender': loggedInUser.email,
          'time': DateTime.now()
        },
      );
      messageTextController.clear();
    }
  }

  // getMessageStream() {
  //   return firestore.collection('messages').snapshots();
  // }
  void getCurrentUser() {
    try {
      final user = auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  onCallTap() => Get.toNamed('/voiceCallScreen');
}
