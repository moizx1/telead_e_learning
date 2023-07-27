import 'package:get/get.dart';

class RegisterController extends GetxController {
  String? email, password;
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

  onEmailChanged(value) {
    email = value;
    update();
  }
  onPasswordChanged(value) {
    password = value;
    update();
  }

  onSignUp(){
    
  }
}
