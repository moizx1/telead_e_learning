import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:telead_e_learning/widgets/accept_call.dart';

import '../constants/constants.dart';
import '../screens/dashboard/inbox/voice_call_screen.dart';

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
              ),
            );
          } else {
            Get.to(
              const AcceptCall(
              ),
            );
          }
        }
      }
    });
  }
}
