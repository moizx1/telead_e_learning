import 'package:get/get.dart';

class LoginController extends GetxController {
  bool isTextVisible = true;
  bool isChecked = false;

  void toggleVisibility() {
    isTextVisible = !isTextVisible;
    update();
  }

  void toggleCheckBox() {
    isChecked = !isChecked;
    update();
  }
}
