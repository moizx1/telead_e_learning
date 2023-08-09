import 'package:get/get.dart';

class InboxController extends GetxController {
 int? currentSelectedCategory = 0;
  void onChatTap() {
    currentSelectedCategory = 0;
    update();
  }

  void onCallsTap() {
    currentSelectedCategory = 1;
    update();
  }
}