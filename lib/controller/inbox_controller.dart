import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class InboxController extends GetxController {
  int? currentSelectedCategory = 0;
  FirebaseAuth auth = FirebaseAuth.instance;
  User? loggedInUser;

  @override
  void onInit() async {
    getCurrentUser();
    super.onInit();
  }

  void getCurrentUser() {
    try {
      final user = auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser?.email);
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

  void onChatTap() => Get.toNamed('/chatScreen');
  void onCallTap() => Get.toNamed('/voiceCallScreen');
}
