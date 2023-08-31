import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:telead_e_learning/screen/voice_call_screen.dart';

import '../constants/constants.dart';

class CallListener {
  void startCallListener() {
    FirebaseFirestore.instance
        .collection('calls')
        .snapshots()
        .listen((snapshot) {
      // Check if the current user's ID exists in any of the documents
      for (DocumentSnapshot document in snapshot.docs) {
        if (document['callerId'] == userData?.email ||
            document['receiverId'] == userData?.email) {
          // The current user exists in the calls collection
          if (document['callerId'] == userData?.email) {
            Get.to(
              VoiceCallScreen(
                boolHost: true,
                boolJoined: true,
                receiverId: document['callerId'],
              ),
            );
          } else {
            Get.to(
              VoiceCallScreen(
                boolHost: false,
                boolJoined: false,
                receiverId: document['callerId'],
              ),
            );
          }
        }
      }
    });
  }
}
