import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class InboxController extends GetxController {
  int? currentSelectedCategory = 0;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot<Object?>>? stream;

  User? loggedInUser;

  @override
  void onInit() {
    getCurrentUser();
    stream = firestore
        .collection('chats')
        .where('participants', arrayContains: loggedInUser?.email)
        .orderBy('time', descending: true)
        .snapshots();
    super.onInit();
  }

  void getCurrentUser() {
    try {
      final user = auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  void chatTabSelect() {
    currentSelectedCategory = 0;
    update();
  }

  void callsTabSelect() {
    currentSelectedCategory = 1;
    update();
  }

  void onChatTap(String chatId, String receiverId) =>
      Get.toNamed('/chatScreen', arguments: [chatId, receiverId, loggedInUser]);
  void onCallTap() => Get.toNamed('/voiceCallScreen');
}
