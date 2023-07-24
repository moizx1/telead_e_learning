import 'package:get/get.dart';

class RegisterController extends GetxController {
  bool isTextVisible = true;

  void toggleVisibility() {
    isTextVisible = !isTextVisible;
    update();
  }
}
