import 'package:get/get.dart';

class LoginController extends GetxController {
  bool isTextVisible = true;

  void toggleVisibility() {
    isTextVisible = !isTextVisible;
    update();
  }
}
