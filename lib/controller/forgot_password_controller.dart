import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  String email = 'abdulmuizpm@gmail.com';
  bool onEmailSelect = false;
  bool onSmsSelect = false;

  toggleEmailSelect() {
    onEmailSelect = !onEmailSelect;
    onSmsSelect = false;
    update();
  }

  toggleSmsSelect() {
    onSmsSelect = !onSmsSelect;
    onEmailSelect = false;
    update();
  }

  onContinueTap() {
    onSmsSelect ? Get.toNamed('/verifyPassword') : null;
  }
}
