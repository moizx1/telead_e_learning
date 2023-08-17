import 'dart:async';

import 'package:get/get.dart';

class VerifyPasswordController extends GetxController {
  int secondsRemaining = 30;
  bool enableResend = false;
  Timer? timer;

  @override
  void onInit() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        secondsRemaining--;
        update();
      } else {
        enableResend = true;
        update();
      }
    });
    super.onInit();
  }

  onVerifyTap() => Get.toNamed('/createPassword');

  void resendCode() {
    //other code here
    secondsRemaining = 30;
    enableResend = false;
    update();
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
