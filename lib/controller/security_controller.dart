import 'package:get/get.dart';

class SecurityController extends GetxController {
  // bool? biometric, faceId;
  bool rememberMe = false, biometric = false, faceId = false;

  toggleRememberMe() {
    rememberMe = !rememberMe;
    update();
  }

  toggleBiometric() {
    biometric = !biometric;
    update();
  }

  toggleFaceId() {
    faceId = !faceId;
    update();
  }
}
