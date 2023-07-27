import 'package:get/get.dart';
class CreateNewPasswordController extends GetxController{
    bool isTextVisible = true;

  void toggleVisibility() {
    isTextVisible = !isTextVisible;
    update();
  }
}