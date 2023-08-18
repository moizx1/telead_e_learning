import 'package:get/get.dart';

class InboxController extends GetxController {
 int? currentSelectedCategory = 0;
  void chatTabSelect() {
    currentSelectedCategory = 0;
    update();
  }

  void callsTabSelect() {
    currentSelectedCategory = 1;
    update();
  }

  void onChatTap()=>Get.toNamed('/chatScreen');
  void onCallTap()=>Get.toNamed('/voiceCallScreen');

  
}